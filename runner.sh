#!/usr/bin/env bash

function usage() {
cat <<EOF
Usage: $0 action

Must specify action (shell|init|vars|plan|apply|destroy|fmt)
EOF
}

VERSION=fedora40

IMAGE="darthfork/dorker:$VERSION"

TARGET=$1

if [ -z "$TARGET" ]; then
    usage
    exit 1
fi

TF_DIR=terraform

MAKE="make --no-print-directory -C ${TF_DIR}"

declare -A actions=(
    [shell]="/usr/bin/env bash"
    [help]="${MAKE} help"
    [init]="${MAKE} init"
    [vars]="${MAKE} vars"
    [plan]="${MAKE} plan"
    [apply]="${MAKE} apply"
    [destroy]="${MAKE} destroy"
    [fmt]="${MAKE} fmt"
    [clean]="${MAKE} clean"
)

ACTION=${actions[$TARGET]}

if [ -z "$ACTION" ]; then
    printf "Invalid action: %s\n" "$TARGET"
    usage
    exit 1
fi

# shellcheck disable=SC2086
docker run -it\
    -v "$PWD":/darthfork/workspace\
    -e AWS_ACCESS_KEY_ID\
    -e AWS_SECRET_ACCESS_KEY\
    -e DO_TOKEN\
    -e SSH_FINGERPRINT\
    -e AWS_ACCOUNT_NUMBER\
    -h dorker_tf_runner\
    "$IMAGE" $ACTION
