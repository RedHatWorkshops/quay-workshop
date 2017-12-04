# lab

Terraform artifacts for deploying a Container Linux training environment.

### Overview

TODO

### Requirements

The utilities listed below are used by Terraform to generate assets locally and need to be installed on the machine used for provisioning the lab environmets.

__puttygen:__ Used to generate SSH private keys for Windows users.

Installing on macOS using Homebrew:

```
brew install putty
```

### Usage

Make a copy of the sample tfvars (`terraform.tfvars.sample`) that is included in
the repository and update the copy for the new environment that is to be
created.

###### Configuration

```
cp terraform.tfvars.sample terraform.tfvars
```

At a minimum, the following values should be set appropriately for your new
environment.

  * `aws_access_key` The AWS access key ID.
  * `aws_secret_key` The AWS secret access key.
  * `cluster_name` The name for the cluster (ex. `sat74`).
  * `lab_count` The number of lab environments to create.
  * `lab_created_by` The user who created the AWS resources.
  * `lab_expiration_date` The expiration date for the AWS resources.

Some optional variables include:

  * `aws_region_name` The AWS region for the cluster (`us-east-1` by default).

See the `variables.tf` file to see the full list of supported variables
and their default values.

__NOTE:__ Be sure that the file is saved as `terraform.tfvars`.

###### Setup

The `setup` step should be run afer a fresh clone of the repository or after
running the `make clean` target This step will configure the local environment
and download any utilities needed.

```
make setup
```

###### Create

Next, create the lab environments. This will take a while as it runs through the
tectonic installation. The more lab environments specified, the longer it will
take.

Currently the average is approximately 5-6 minutes per lab environment.
Therefore, be prepared for deploying 15 lab environments to take about an hour
and a half.

```
make lab-create
```

###### Destroy

When the lab environments are no longer needed, destroy them. This step will
also take a while to complete as it runs through the tear down of the tectonic
environments.

```
make lab-destroy
```

###### Clean

To start fresh, clean out the local environment and remove all generated assets.
This returns the local environment to a pristine state, similar to a fresh clone
of the repository.

```
make clean
```

### Assets

When you deploy a lab environment, the assets that are generated are kept in the
`assets` directory. You will find the cluster keypair along with the assets for
the individual tectonic lab environments.

```
ls -la assets
```

### Master Node

A master node is created automatically as part of the process, however a manual
step remains to add the cluster public key to github as a deployment key.

Once the `lab-create` step is complete, perform the following steps.

First, copy the contents of the cluster private key onto your local clipboard.
Replace `CLUSTER_NAME` with you actual cluster name.

```
cat assets/CLUSTER_NAME-key.pub
```

Next, add the public key to Github.

  1. Log into Github and navigate to the
[Deployment Keys](https://github.com/coreos-inc/training-cl-essentials/settings/keys)
section in the Settings for the repository.
  1. Click the __Add deploy key__ button to add a new deployment key.
  1. Provide a meaningful title for the deployment key (ex. `sfo829-key`).
  1. Paste the public key from the clipboard into the __Key__ textarea.
  1. Click the __Add key__ button to save the new deployment key.

Once the deployment key has been saved in Github, SSH into the master node.

```
ssh -i assets/CLUSTER_NAME-key ubuntu@CLUSTER_NAME.coreostrain.me
```

Clone the repository to the master node. This should use the deployment key that
was just added. If you want to use a branch, instead of master, just use git to
checkout the branch after the repository is cloned.

```
git clone git@github.com:coreos-inc/training-cl-essentials.git
```

Move the cloned repository to a well-known location on the host.

```
sudo mkdir -p /opt/training
sudo mv training-cl-essentials /opt/training/
sudo chown -R ubuntu: /opt/training
cd /opt/training/training-cl-essentials
```

Once the repository has been cloned successfully, the next step is to build the
static content for the lab exercises. This will use `docker` to pull down the
`jekyll` image for building the static content.

```
docker run --rm -it -v `pwd`/content:/srv/jekyll jekyll/jekyll /bin/sh -c 'bundle install; jekyll build'
```

The site should now be available in the browser.

```
http://CLUSTER_NAME.coreostrain.me
```

The point of cloning the repository to the master is to make it easy to make
changes on the fly in a classroom setting. The instructor can make changes and
commit locally, then re-pull on the master as needed.

```
cd /opt/training
git pull
docker run --rm -it -v `pwd`/content:/srv/jekyll jekyll/jekyll /bin/sh -c 'bundle install; jekyll build'
```
