#!/bin/bash
if [ -z "$1" -o -z "$2" ];then
    echo 'usage rgrep [find] [replace]'
    exit 1
fi

arg1=$1
arg2=$2

git status -s|awk '{print $2}'|xargs -I [] find [] -type f -exec grep -Hn --color "$arg1" {} \;
echo "$arg1 be replaced by $arg2"
read -t 30 -n 3 -p "replace string,need confirm(y/n):" input 
if [ -z "$input" ];then
    input='n'
fi

if test $input = 'y'; then
    git status -s|awk '{print $2}'|xargs -I [] find [] -type f -exec sed -i "s#$arg1#$arg2#g" {} \;
else
    echo 'cancel replace'
fi
