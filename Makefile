.PHONY: all plan apply

.DEFAULT_GOAL := all

TARGETS	:= shell help init vars plan apply destroy fmt clean
TF_DIR	:= terraform
RUNNER	:= ${CURDIR}/runner.sh

$(TARGETS):
	@$(RUNNER) $@

all:
	@echo "Please specify a target: "
	@$(MAKE) --no-print-directory -C $(TF_DIR) help

init: vars

plan: vars init

apply: vars init plan
