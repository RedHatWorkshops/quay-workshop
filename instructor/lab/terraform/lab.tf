# Configure local values
locals {
  cluster_dir = "${var.assets_dir}/clusters/${var.cluster_name}"
  cluster_key_name = "${var.cluster_name}${var.lab_key_suffix}"
}

# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

# Configure Container-Linux AMI
data "aws_ami" "coreos_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CoreOS-stable-1465*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-id"
    values = ["595879546273"]
  }
}

# Configure Ubuntu AMI
data "aws_ami" "ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "owner-id"
    values = ["099720109477"]
  }
}

# Configure default VPC
data "aws_vpc" "default" {
  default = true
}

# Configure subnets for default VPC
data "aws_subnet_ids" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
}

# Create the local cluster asset directory
resource "null_resource" "local-cluster-assets" {
  provisioner "local-exec" {
    command = "mkdir -p ${local.cluster_dir}"
  }
}

# Create cluster ssh key pair
resource "tls_private_key" "cluster-key" {
  algorithm = "RSA"
}

# Save cluster private key locally
resource "local_file" "cluster-private-key" {
    content  = "${tls_private_key.cluster-key.private_key_pem}"
    filename = "${local.cluster_dir}/${var.cluster_name}-key"
}

# Save cluster public key locally
resource "local_file" "cluster-public-key" {
    content  = "${tls_private_key.cluster-key.public_key_openssh}"
    filename = "${local.cluster_dir}/${var.cluster_name}-key.pub"
}

# Set permissions on cluster keypair
resource "null_resource" "local-cluster-permissions" {
  depends_on = [
    "local_file.cluster-private-key",
    "local_file.cluster-public-key"
  ]

  provisioner "local-exec" {
    command = "chmod 400 ${local.cluster_dir}/${var.cluster_name}-key*"
  }
}

# Add public key to AWS
resource "aws_key_pair" "lab-key" {
  key_name   = "${local.cluster_key_name}"
  public_key = "${tls_private_key.cluster-key.public_key_openssh}"
}

# Create the local asset directories for each lab environment
resource "null_resource" "local-lab-assets" {
  count = "${var.lab_count}"

  provisioner "local-exec" {
    command = "mkdir -p ${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}"
  }
}

# Create ssh keypair for each lab
resource "tls_private_key" "lab-access-key" {
  algorithm = "RSA"
  count     = "${var.lab_count}"
}

# Save lab environment private key locally
resource "local_file" "local-lab-access-private-key" {
  depends_on = [
    "tls_private_key.lab-access-key",
    "null_resource.local-lab-assets"
  ]
  count      = "${var.lab_count}"
  content    = "${element(tls_private_key.lab-access-key.*.private_key_pem, count.index)}"
  filename   = "${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}/${format("%s%02d-key", var.lab_prefix, count.index + var.lab_start)}"
}

# Save lab environment public key locally
resource "local_file" "local-lab-access-public-key" {
  depends_on = [
    "tls_private_key.lab-access-key",
    "null_resource.local-lab-assets"
  ]
  count      = "${var.lab_count}"
  content    = "${element(tls_private_key.lab-access-key.*.public_key_openssh, count.index)}"
  filename   = "${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}/${format("%s%02d-key.pub", var.lab_prefix, count.index + var.lab_start)}"
}

# Save lab environment private key in putty format locally
resource "null_resource" "local-lab-access-putty-key" {
  depends_on = ["local_file.local-lab-access-private-key"]
  count      = "${var.lab_count}"

  provisioner "local-exec" {
    command = "puttygen ${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}/${format("%s%02d-key", var.lab_prefix, count.index + var.lab_start)} -o ${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}/${format("%s%02d-key.ppk", var.lab_prefix, count.index + var.lab_start)}"
  }
}

resource "null_resource" "local-lab-access-permissions" {
  depends_on = [
    "local_file.local-lab-access-private-key",
    "local_file.local-lab-access-public-key"
  ]
  count      = "${var.lab_count}"

  provisioner "local-exec" {
    command = "chmod 400 ${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}/*-key*"
  }
}

resource "null_resource" "local-archive" {
  depends_on = ["null_resource.local-lab-access-permissions"]
  count      = "${var.lab_count}"

  provisioner "local-exec" {
    command = "cd ${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)} && zip -r ${format("%s%02d.zip", var.lab_prefix, count.index + var.lab_start)} *-key*"
  }
}

# Create bastion node
resource "aws_instance" "bastion" {
  ami                         = "${data.aws_ami.ubuntu_ami.id}"
  instance_type               = "${var.bastion_instance_type}"
  key_name                    = "${local.cluster_key_name}"
  associate_public_ip_address = true

  tags {
    Name = "${var.cluster_name}-${var.bastion_name_suffix}"
    createdBy = "${var.lab_created_by}"
    expirationDate = "${var.lab_expiration_date}"
  }
}

# Create the launch configuration for each lab environment
resource "aws_launch_configuration" "lab" {
  count         = "${var.lab_count}"
  name          = "${var.cluster_name}-${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}"
  image_id      = "${data.aws_ami.coreos_ami.id}"
  instance_type = "${var.lab_instance_type}"

  lifecycle {
    create_before_destroy = true
  }
}

# Create the autoscaling group for each lab environment
resource "aws_autoscaling_group" "lab" {
  count                = "${var.lab_count}"
  name                 = "${var.cluster_name}-${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}"
  launch_configuration = "${aws_launch_configuration.lab.name}"
  max_size             = "${var.lab_cluster_count}"
  min_size             = "${var.lab_cluster_count}"
  desired_capacity     = "${var.lab_cluster_count}"
  vpc_zone_identifier  = ["${data.aws_subnet_ids.default.ids}"]

  tags = [
    {
      key                 = "labName"
      value               = "${var.cluster_name}-${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}"
      propagate_at_launch = true
    },
    {
      key                 = "createdBy"
      value               = "${var.lab_created_by}"
      propagate_at_launch = true
    },
    {
      key                 = "expirationDate"
      value               = "${var.lab_expiration_date}"
      propagate_at_launch = true
    },
  ]
}

# Generate environment data
data "template_file" "environment" {
  depends_on = ["null_resource.local-lab-assets"]
  template   = "${file("environment.tpl")}"
  count      = "${var.lab_count}"

  vars {
    domain_name  = "${var.domain_name}"
    cluster_name = "${var.cluster_name}"
    lab_name     = "${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}"
    lab_number   = "${format("%s%02d", "", count.index + var.lab_start)}"
  }
}

# Save environment HTML file
resource "local_file" "environment" {
  content  = "${element(data.template_file.environment.*.rendered, count.index)}"
  filename = "${local.cluster_dir}/${format("%s%02d", var.lab_prefix, count.index + var.lab_start)}/environment.html"
  count    = "${var.lab_count}"
}
