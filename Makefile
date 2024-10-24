.PHONY: all plan apply

.DEFAULT_GOAL := all

TARGETS	:= init vars plan apply destroy fmt clean
TF_DIR	:= terraform
RUNNER	:= ${CURDIR}/runner.sh

$(TARGETS):
	@$(RUNNER) $@

all:
	@echo "Please specify a target: "
	@$(MAKE) --no-print-directory -C $(TF_DIR) help

plan: vars init

apply: vars init plan
