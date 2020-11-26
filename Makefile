.PHONY: all plan apply

TARGETS := plan apply init vars shell
RUNNER := ${CURDIR}/runner.sh

$(TARGETS):
	@${RUNNER} $@

all: plan

plan: vars init

apply: vars init plan
