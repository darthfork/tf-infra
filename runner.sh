#!/usr/bin/env bash

usage() {
cat <<EOF
Usage: $0 action

Must specify action (shell|init|vars|plan|apply|destroy|fmt)
EOF
}

VERSION=fedora35

IMAGE="darthfork/dorker:$VERSION"

TARGET=$1
TF_DIR=terraform

declare -A actions=(
    [shell]="/usr/bin/env bash"
    [vars]="./build_tfvars.sh"
    [init]="make -C ${TF_DIR} init"
    [plan]="make -C ${TF_DIR} plan"
    [apply]="make -C ${TF_DIR} apply"
    [destroy]="make -C ${TF_DIR} destroy"
    [fmt]="make -C ${TF_DIR} fmt"
)

ACTION=${actions[$TARGET]}

if [ -z "$ACTION" ]; then
    echo "Invalid action"
    usage
    exit 1
fi

docker run -it\
    -v "$PWD":/darthfork/workspace\
    -e AWS_ACCESS_KEY_ID\
    -e AWS_SECRET_ACCESS_KEY\
    -e DO_TOKEN\
    -e SSH_FINGERPRINT\
    -e AWS_ACCOUNT_NUMBER\
    -h dorker_tf_runner\
    "$IMAGE" $ACTION
