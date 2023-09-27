#!/usr/bin/env bash

MANIFEST=${1}
DELETE=${2}


if [ -z ${MANIFEST} ]; then
    echo ""
    echo "Apply a manifest processed by gomplate with kubectl. The file 'config.yml' is used for configuration."
    echo ""
    echo "USAGE:" 
    echo "    apply.sh <manfifest.yml> [-d]"
    echo ""
    echo "OPTIONS:"
    echo "    -d: Use delete to undeploy the Kubernetes objects"
    echo ""
    exit 1
fi

if [[ ${DELETE} == "-d" ]]; then
    CMD=delete
else
    CMD=apply
fi

gomplate -f ${MANIFEST} -c config=config.yml | kubectl ${CMD} -f - ${@:3}
