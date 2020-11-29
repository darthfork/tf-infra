.PHONY: all plan apply

TARGETS := plan apply init vars shell
TF_DIR := terraform
RUNNER := ${CURDIR}/runner.sh

$(TARGETS):
	@${RUNNER} $@

all: plan

plan: vars init

apply: vars init plan

clean:
	@rm -rf $(TF_DIR)/.terraform $(TF_DIR)/terraform.tfvars
