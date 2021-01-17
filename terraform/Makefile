.PHONY: plan apply init

TF_BIN := terraform

init:
	$(TF_BIN) init

plan:
	$(TF_BIN) plan -var-file terraform.tfvars -out CURRENTPLAN.tfplan

plan_nc:
	$(TF_BIN) plan\
		-input=false\
		-no-color\
		-var-file terraform.tfvars\
		-out CURRENTPLAN.tfplan

apply:
	$(TF_BIN) apply -auto-approve -var-file terraform.tfvars

clean:
	@rm -rf .terraform terraform.tfvars
