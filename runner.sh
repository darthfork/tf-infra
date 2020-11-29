#!/usr/bin/env bash

usage() {
cat <<EOF
Usage: $0 action

Must specify action (shell|init|vars|plan|apply)
EOF
}

IMAGE="darthfork/dorker:latest"

TARGET=$1
TF_DIR=terraform

declare -A actions=(
    [shell]="/bin/bash"
    [vars]="./build_tfvars.sh"
    [init]="make -C ${TF_DIR} init"
    [plan]="make -C ${TF_DIR} plan"
    [apply]="make -C ${TF_DIR} apply"
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
