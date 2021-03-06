#!/bin/bash
set -e

if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
    echo "usage cmd [find] [replace] [path]"
    exit 1
fi

grep "$1" --exclude-dir=.git -r --color $3

echo "$1 be replaced by $2"
read -t 30 -n 3 -p "replace string,need confirm(y/n):" confirm 

if [ $confirm = "y" ]
then
    grep "$1" --exclude-dir=.git -r $3 | awk -F : "{print $1}" | uniq | xargs sed -i "s#$1#$2#g"
else
    echo "cancel relace"
fi  
