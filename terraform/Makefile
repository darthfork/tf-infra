.PHONY: plan plan_nc apply init clean

TF_BIN	:= terraform

init:
	$(TF_BIN) init

plan:
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

apply:
	$(TF_BIN) apply\
		-auto-approve\
		-var-file terraform.tfvars

destroy:
	$(TF_BIN) destroy

fmt:
	$(TF_BIN) fmt

clean:
	@rm -rf .terraform terraform.tfvars
