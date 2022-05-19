#!/bin/sh
file="/tmp/rtab.lock"
if [ ! -f "$file" ]; then
    touch /tmp/rtab.lock
    sleep 30
    /etc/init.d/redsocks2 start
    for n in $(cat /etc/chinadns_chnroute.txt)
    do
    iptables -t nat -I REDSOCKS2 -d $n -j RETURN
    done
    rm /tmp/rtab.lock
fi
