#!/bin/bash
set -e

iptables -nL INPUT
if [ -n "$1" ]
then
    iptables -F INPUT 
    iptables -I INPUT -p tcp --dport 8081:8085 -j DROP
    iptables -I INPUT -s $1 -p tcp --dport 8081:8085 -j ACCEPT
fi
iptables -nL INPUT
