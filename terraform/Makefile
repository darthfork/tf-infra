.PHONY: help plan plan_nc apply init clean

TF_BIN	:= terraform

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

init: ## Initialize terraform workspace
	$(TF_BIN) init

plan: ## Run Terraform plan
	$(TF_BIN) plan\
		-input=false\
		-var-file terraform.tfvars\
		-out CURRENTPLAN.tfplan

plan_nc:
	$(TF_BIN) plan\
		-input=false\
		-no-color\
		-var-file terraform.tfvars\
		-out CURRENTPLAN.tfplan

apply: ## Apply Terraform changes
	$(TF_BIN) apply\
		-auto-approve\
		-var-file terraform.tfvars

destroy: ## Destroy resources
	$(TF_BIN) destroy

fmt: ## Format terraform code
	$(TF_BIN) fmt

clean: ## Clean terraform workspace
	@rm -rf .terraform terraform.tfvars
