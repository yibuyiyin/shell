#!/bin/bash

set -e

if [ -z "$1" ]
then
    echo "usage $0 [selectdb:0~16;default:1]"
    exit 1
fi

if [ ! -z "$1" ]
then
    selectdb=$1
else
    selectdb=1
fi

function rediscli()
{
    set -- docker exec -i redis_server redis-cli $@
    eval "$@"
}

rediscli -n $selectdb "keys \"*\""
