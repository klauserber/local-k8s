#!/usr/bin/env bash

DELETE=${1}

if [[ ${DELETE} == "-d" ]]; then
    CMD=delete
else
    CMD=apply
fi

gomplate -f app.yml -c config=../config.yml | kubectl ${CMD} -f - ${@:2}
