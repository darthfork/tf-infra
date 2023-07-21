.PHONY: all plan apply

.DEFAULT_GOAL := all

TARGETS	:= plan apply init vars shell destroy fmt clean
TF_DIR	:= terraform
RUNNER	:= ${CURDIR}/runner.sh

$(TARGETS):
	@$(RUNNER) $@

all:
	@echo "Please specify a target: "
	@$(MAKE) --no-print-directory -C $(TF_DIR) help

plan: vars init

apply: vars init plan