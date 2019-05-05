#!/bin/bash
if [ -z "$1" -o -z "$2" ];then
    echo 'usage rgrep [find] [replace]'
    exit 1
fi

arg1=$1
arg2=$2

grep --exclude-dir=.ide/ --exclude-dir=.git/ $arg1 -r --color .
echo "$arg1 be replaced by $arg2"
read -t 30 -n 3 -p "replace string,need confirm(y/n):" input 
if [ -z "$input" ];then
    input='n'
fi

if test $input = 'y'; then
    line=`grep --exclude-dir=.ide/ --exclude-dir=.git/ $arg1 -r .|awk -F : '{print $arg1}'|uniq`
    for src in $line; do
        dst=`echo $src|sed "s#$arg1#$arg2#g"`
        dst_dir=${dst%/*}
        if [ ! -d $dst_dir ];then
            mkdir -p $dst_dir
        fi
        if test "$src" != "$dsta" -a ! -e "$dst" ;then
            cp $src $dst
            sed -i "s#$arg1#$arg2#g" $dst 
        fi
    done
else
    echo 'cancel relace'
fi  
