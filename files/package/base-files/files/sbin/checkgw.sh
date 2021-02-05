#!/bin/sh
iptables-save | grep zone_lan_prerouting | grep REDSOCKS2 && exit 0
/etc/init.d/redsocks2 enabled && iptables -t nat -A zone_lan_prerouting -p tcp -j REDSOCKS2
