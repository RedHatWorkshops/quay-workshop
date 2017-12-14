variable "aws_access_key" {
  description = "AWS access key"
  type        = "string"
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = "string"
}

variable "aws_region" {
  description = "AWS region"
  type        = "string"
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain name"
  type        = "string"
  default     = "coreostrain.me"
}

variable "cluster_name" {
  description = "Cluster name"
  type        = "string"
  default     = "cl01"
}

variable "lab_count" {
  description = "Lab count"
  type        = "string"
  default     = "3"
}

variable "lab_start" {
  description = "Lab start"
  type        = "string"
  default     = "1"
}

variable "lab_created_by" {
  description = "Lab created by"
  type        = "string"
}

variable "lab_expiration_date" {
  description = "Lab expiration date"
  type        = "string"
}

variable "lab_prefix" {
  description = "Lab name prefix"
  type        = "string"
  default     = "lab"
}

variable "lab_key_suffix" {
  description = "Lab key name suffix"
  type        = "string"
  default     = "-key"
}

variable "assets_dir" {
  description = "Assets directory"
  type        = "string"
  default     = "/opt/training/assets"
}

variable "bastion_instance_type" {
  description = "Bastion instance type"
  type        = "string"
  default     = "t2.micro"
}

variable "bastion_user" {
  description = "Bastion user"
  type        = "string"
  default     = "ubuntu"
}

variable "bastion_user_groups" {
  description = "Bastion user groups"
  type        = "string"
  default     = "adm,sudo"
}

variable "bastion_name_suffix" {
  description = "Bastion name suffix"
  type        = "string"
  default     = "bastion"
}

variable "lab_instance_type" {
  description = "Lab instance type"
  type        = "string"
  default     = "t2.micro"
}

variable "lab_cluster_count" {
  description = "Lab cluster count"
  type        = "string"
  default     = "3"
}

variable "master_instance_type" {
  description = "Master instance type"
  type        = "string"
  default     = "t2.micro"
}

variable "master_name_suffix" {
  description = "Master name suffix"
  type        = "string"
  default     = "master"
}

variable "master_user" {
  description = "Master user"
  type        = "string"
  default     = "ubuntu"
}

variable "master_web_root" {
  description = "Master web root"
  type        = "string"
  default     = "/opt/training/training-k8s-fundamentals/content/_site"
}

variable "master_site_username" {
  description = "Master site username"
  type        = "string"
  default     = "kubernetes"
}

variable "master_site_password" {
  description = "Master site password"
  type        = "string"
  default     = "coreostrainme"
}
