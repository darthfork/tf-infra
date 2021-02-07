.PHONY: all plan apply

.DEFAULT_GOAL := all

TARGETS	:= plan apply init vars shell
TF_DIR	:= terraform
RUNNER	:= ${CURDIR}/runner.sh

$(TARGETS):
	@$(RUNNER) $@

all:
	@echo "Please specify a target"
	@echo "Targets: $(TARGETS)"

plan: vars init

apply: vars init plan

clean:
	@make -C $(TF_DIR) clean
