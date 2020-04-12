#!/bin/bash
set -e

localPort=$1

if [[ -z $localPort ]]
then
    echo "==============="
    echo
    echo "Usage: ./"$(basename $0)" localPort"
    echo 
    echo "Example: ./"$(basename $0)" 8081"
    echo 
    echo "==============="
    exit 1
fi

nohup vue ui -H 0 -p $localPort >> /tmp/vue.ui.log 2>&1 &
