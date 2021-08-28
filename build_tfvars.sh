#!/usr/bin/env bash

cat << HEREDOC > terraform/terraform.tfvars
do_token           = "$DO_TOKEN"
ssh_fingerprint    = "$SSH_FINGERPRINT"
aws_access_key     = "$AWS_ACCESS_KEY_ID"
aws_secret_key     = "$AWS_SECRET_ACCESS_KEY"
aws_account_number = "$AWS_ACCOUNT_NUMBER"
HEREDOC
