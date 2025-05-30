#!/bin/bash

BASE_DIR=`dirname $0`
POSITIONAL_ARGS=()

print_usage() {
    echo "Usage: $0 OCI_IMAGE EIF_IMAGE"
    exit 1
}

OCI_IMAGE=$1
EIF_IMAGE=$2
