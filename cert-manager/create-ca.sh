#!/usr/bin/env sh

# 40 years validity
openssl req -x509 \
            -sha256 -days 14610 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=LocalCA/O=LocalDevelopment/OU=local" \
            -keyout rootCA.key -out rootCA.crt

