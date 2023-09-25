FROM alpine:3.18.3

ARG TARGETARCH
ARG TARGETOS=linux

RUN apk add --no-cache npm

RUN npm install -g localtunnel

ENTRYPOINT [ "lt" ]
