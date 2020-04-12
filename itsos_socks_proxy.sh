#!/usr/bin/env bash

listenPort=$1
localPort=$2
remoteUser=$3
remoteHost=$4
remotePort=$5

if [[ -z $listenPort || -z $localPort || -z $remoteUser || -z $remoteHost || -z $remotePort ]]
then
    cmd=$(basename $0)
    echo "===================================="
    echo 
    echo "SSH sockets 隧道"
    echo 
    echo "Usage: ${cmd} listenPort localPort remoteUser remoteHost remotePort"
    echo 
    echo "Example: ${cmd} 3223 1080 root 192.168.1.1 22"
    echo 
    echo "===================================="
    exit 1
fi

nc -w 10 -zv 127.0.0.1 $listenPort > /dev/null 2>&1
if test $? -eq 1; then
    /usr/bin/autossh -M $listenPort -f -CND $localPort -p $remotePort $remoteUser@$remoteHost
    bakname=$(date +%Y-%m-%d:%H:%M:%S)
    echo $bakname": Start autossh ${listenPort}" >> /tmp/ssh.log
    echo "=============="
    echo
    echo "socks5: 127.0.0.1:$localPort"
    echo
    echo "=============="
fi

nc -w 10 -zv $remoteHost $remotePort > /dev/null 2>&1
if test $? -eq 1; then
    lsof -i :$listenPort|awk '{print $2}'|grep -v PID|uniq|xargs kill -USR2
    echo $bakname": Restart ssh $listenPort" >> /tmp/ssh.log
fi
