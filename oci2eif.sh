#!/bin/bash

BASE_DIR=`dirname $0`
POSITIONAL_ARGS=()

print_usage() {
    echo "Usage: $0 OCI_IMAGE EIF_IMAGE"
    exit 1
}

if [ ! -e nitro-cli ]; then
    echo "nitro-cli binary not built, please run build-cli.sh"
    exit 1
fi

OCI_IMAGE=$1
EIF_IMAGE=$2

if [ -z ${OCI_IMAGE} ] || [ -z ${EIF_IMAGE} ]; then
	print_usage
fi

./nitro-cli build-enclave --docker-uri $OCI_IMAGE --output-file file.eif
