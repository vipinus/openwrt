#!/bin/sh
/etc/init.d/redsocks2 disable
for n in $(cat /etc/chinadns_chnroute.txt)
do
iptables -t nat -I REDSOCKS2 -d $n -j RETURN
done
/etc/init.d/redsocks2 enable
/etc/init.d/redsocks2 restart
