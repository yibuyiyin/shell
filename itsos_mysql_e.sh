#!/bin/bash

set -e

if [ "${1#-}" != "$1" ]; then
    set -- docker exec -i mysql mysql \
        --default-character-set "utf8" $@
fi

eval "$@"
