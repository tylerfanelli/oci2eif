#!/bin/bash

BASE_DIR=`dirname $0`
POSITIONAL_ARGS=()

print_usage() {
    echo "Usage: $0 OCI_IMAGE"
    exit 1
}

if [ ! -e nitro-cli ]; then
    echo "nitro-cli binary not built, please run build-cli.sh"
    exit 1
fi

OCI_IMAGE=$1

if [ -z ${OCI_IMAGE} ]; then
	print_usage
fi

./nitro-cli build-enclave --docker-uri $OCI_IMAGE --output-file file.eif

cat << EOF > .krun_vm.json
{
    "flavor":"aws-nitro",
    "eif_file":"/krun-nitro-app.eif",
    "cpus":1,
    "ram_mib":512,
}
EOF

cat << EOF > Dockerfile
FROM scratch

COPY file.eif /krun-nitro-app.eif
COPY .krun_vm.json /.krun_vm.json
EOF

docker build -t ${OCI_IMAGE}-nitro .
