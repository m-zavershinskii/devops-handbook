#! /usr/bin/env bash

set -a

STACK=${1}

source ./.env.${STACK}

envsubst < docker-stack.yml | docker stack deploy -c - ${STACK}
