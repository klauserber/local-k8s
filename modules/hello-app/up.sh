#!/usr/bin/env sh

gomplate -f app.yml -c config=../../config.yml | kubectl apply -f -
