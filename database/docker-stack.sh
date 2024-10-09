#! /usr/bin/env bash

set -ae

DOCKER_CTX=default

while getopts "c:a:e:" flag; do
    case ${flag} in
        c) DOCKER_CTX=${OPTARG};;
        a) ACTION=${OPTARG};;
        e) WORK_ENV=${OPTARG} && source ./.env.${WORK_ENV};;
    esac
done

cmd="docker -c ${DOCKER_CTX} stack ${ACTION}"

# config      Outputs the final config file, after doing merges and interpolations
# deploy      Deploy a new stack or update an existing stack
# ls          List stacks
# ps          List the tasks in the stack
# rm          Remove one or more stacks
# services    List the services in the stack
case ${ACTION} in
    config) cmd="${cmd} -c docker-compose.yml";;
    up|deploy) cmd="${cmd} -c docker-compose.yml ${WORK_ENV}";;
    ps|rm|services) cmd="${cmd} ${WORK_ENV}";;
esac

$cmd
