.PHONY: all plan apply

all: plan apply

vars:
	@bash ${CURDIR}/build_tfvars.sh

plan: vars
	terraform plan -var-file terraform.tfvars

apply: vars
	terraform apply -var-file terraform.tfvars

clean:
	@rm *.tfvars
