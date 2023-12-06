#! /usr/bin/env bash

set -a

STACK=${1}
DOCKER_CTX=${2:-default}

source ./.env.${STACK}

envsubst < docker-stack.yml | docker -c ${DOCKER_CTX} stack deploy -c - ${STACK}
