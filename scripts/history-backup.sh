#! /usr/bin/env bash

set -exuo pipefail

BASH_BACKUP=".bash_history.`date '+%Y-%m-%d'`"

cp ~/.bash_history ${BASH_BACKUP}
gzip -9 ${BASH_BACKUP}
