.PHONY: help init vars plan apply destroy fmt clean

TF_BIN	:= terraform

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

init: ## Initialize terraform workspace
	$(TF_BIN) init

vars: clean ## Build terraform.tfvars file
	@echo 'do_token           = "${DO_TOKEN}"' > terraform.tfvars
	@echo 'ssh_fingerprint    = "${SSH_FINGERPRINT}"' >> terraform.tfvars
	@echo 'aws_access_key     = "${AWS_ACCESS_KEY_ID}"' >> terraform.tfvars
	@echo 'aws_secret_key     = "${AWS_SECRET_ACCESS_KEY}"' >> terraform.tfvars
	@echo 'aws_account_number = "${AWS_ACCOUNT_NUMBER}"' >> terraform.tfvars

plan: ## Run Terraform plan
	$(TF_BIN) plan\
		-input=false\
		-var-file terraform.tfvars\
		-out CURRENTPLAN.tfplan

plan_ci:
	$(TF_BIN) plan\
		-input=false\
		-no-color\
		-var-file terraform.tfvars\
		-out CURRENTPLAN.tfplan

apply: ## Apply Terraform changes
	$(TF_BIN) apply\
		-auto-approve\
		-var-file terraform.tfvars

apply_ci:
	$(TF_BIN) apply\
		-auto-approve\
		-no-color\
		-var-file terraform.tfvars

destroy: ## Destroy resources
	$(TF_BIN) destroy

fmt: ## Format terraform code
	$(TF_BIN) fmt

clean: ## Clean terraform workspace
	@rm -rf .terraform terraform.tfvars CURRENTPLAN.tfplan
