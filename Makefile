.PHONY: all plan apply

all: plan apply

vars:
	@${CURDIR}/build_tfvars.sh

plan: build_vars
	terraform plan -var-file terraform.tfvars

apply: build_vars
	terraform apply -var-file terraform.tfvars

clean: 
	@rm *.tfvars
