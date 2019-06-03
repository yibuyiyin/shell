#!/bin/bash

set -e

if [ -z "$1" ]
then
    echo "usage $0 keyword [selectdb:0~16]"
    exit 1
fi

if [ ! -z "$2" ]
then
    selectdb=$2
else
    selectdb=1
fi

function rediscli()
{
    set -- docker exec -i redis_server redis-cli $@
    eval "$@"
}

lines=$(rediscli -n $selectdb "keys \"*\"" | grep $1 | awk '{print $1}')

if [ -z "$lines" ]
then
    echo "No matching $1."
    exit 0
fi

for line in $lines
do
    echo $line
done

read -t 30 -n 3 -p "Delete the above. Need confirm(y/n):" confirm 
if test $confirm != 'y'
then
    echo "cancel"
    exit 0
fi

for line in $lines
do
    echo $line
    rediscli -n $selectdb del $line
    echo $?
done

echo "done"
