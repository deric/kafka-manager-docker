#!/bin/bash

APPLICATION_SECRET="${APPLICATION_SECRET:-$(date +%s | sha256sum | base64 | head -c 64 ; echo)}"
HTTP_CONTEXT="${HTTP_CONTEXT:-/}"
ZK_HOSTS="${ZK_HOSTS:zookeeper:2181}"
KAFKA_MANAGER_LOGLEVEL="${KAFKA_MANAGER_LOGLEVEL:-INFO}"

exec ./bin/kafka-manager -Dconfig.file=${KAFKA_MANAGER_CONFIGFILE} "${KAFKA_MANAGER_ARGS}" "${@}"
