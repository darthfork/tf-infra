.PHONY: plan apply init

TF_BIN := terraform

init:
	$(TF_BIN) init

plan:
	$(TF_BIN) plan -var-file terraform.tfvars

apply:
	$(TF_BIN) apply -var-file terraform.tfvars

clean:
	@rm -rf .terraform terraform.tfvars
