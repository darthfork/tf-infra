#!/usr/bin/env bash

usage() {
cat <<EOF
Usage: $0 action

Must specify action (shell|init|vars|plan|apply)
EOF
}

IMAGE="darthfork/dorker:latest"

TARGET=$1

declare -A actions=(
    [shell]="/bin/bash"
    [init]="terraform init"
    [vars]="/usr/bin/env bash ./build_tfvars.sh"
    [plan]="terraform plan -var-file terraform.tfvars"
    [apply]="terraform apply -var-file terraform.tfvars"
)

ACTION=${actions[$TARGET]}

if [ -z "$ACTION" ]; then
    echo "Invalid action"
    usage
    exit 1
fi

docker run -it\
    -v "$PWD":/workspace\
    -e AWS_ACCESS_KEY_ID\
    -e AWS_SECRET_ACCESS_KEY\
    -e AWS_ACCOUNT_NUMBER\
    --user "$(id -u):$(id -g)"\
    -h dorker_runner\
    "$IMAGE" $ACTION
