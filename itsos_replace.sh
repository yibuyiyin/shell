#!/bin/bash
if [ -z "$1" -o -z "$2" ];then
    echo 'usage rgrep [find] [replace]'
    exit 1
fi
grep "$1" --exclude-dir=.git -r --color .
echo "$1 be replaced by $2"
read -t 30 -n 3 -p "replace string,need confirm(y/n):" ret 
if [ -z "$ret" ];then
    ret='n'
fi
if test $ret = 'y'; then
    grep "$1" --exclude-dir=.git -r .|awk -F : '{print $1}'|uniq|xargs sed -i "s#$1#$2#g"
else
    echo 'cancel relace'
fi  
