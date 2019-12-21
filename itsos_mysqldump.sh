#!/bin/bash
set -e

if [ "${1#-}" != "$1" ]; then
    set -- docker exec -i mysql mysqldump \
        --default-character-set "utf8" $@
fi

eval "$@"
