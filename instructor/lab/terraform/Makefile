.DEFAULT_GOAL := state

ASSETS_DIR=/opt/training/assets

#
# Clean
#

.PHONY: clean
clean:
	rm -fr $(ASSETS_DIR)/clusters
	rm -fr $(ASSETS_DIR)/*.tfstate*

#
# Create
#

.PHONY: create
create:
	terraform init
	terraform plan -state=$(ASSETS_DIR)/terraform.tfstate -var-file=$(ASSETS_DIR)/terraform.tfvars
	terraform apply -auto-approve -state=$(ASSETS_DIR)/terraform.tfstate -var-file=$(ASSETS_DIR)/terraform.tfvars

#
# Destroy
#

.PHONY: destroy
destroy:
	terraform init
	terraform destroy -force -state=$(ASSETS_DIR)/terraform.tfstate -var-file=$(ASSETS_DIR)/terraform.tfvars

#
# State
#
.PHONY: state
state:
	terraform state list -state=$(ASSETS_DIR)/terraform.tfstate
