#!/bin/sh
file="/tmp/rtab.lock"
if [ ! -f "$file" ]; then
    touch /tmp/rtab.lock
    /etc/init.d/redsocks2 disable
    for n in $(cat /etc/chinadns_chnroute.txt)
    do
    iptables -t nat -I REDSOCKS2 -d $n -j RETURN
    done
    /etc/init.d/redsocks2 enable
    /etc/init.d/redsocks2 restart
    rm /tmp/rtab.lock
fi
