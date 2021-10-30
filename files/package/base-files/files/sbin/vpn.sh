#!/bin/sh

set -e
echo "nameserver 114.114.114.114" > /etc/resolv.conf

lock="/tmp/vpn.lock"
if [ ! -f "$lock" ]; then
touch $lock
echo "nameserver 114.114.114.114" > /etc/resolv.conf

username=$(grep username /etc/config/vpn | cut -f 2 -d "'")
password=$(grep password /etc/config/vpn | cut -f 2 -d "'")

mac=$(ip link show br-lan | awk -e '/^\s*link\//{print $2}')
pass=$(echo -n $password | md5sum | cut -f 1 -d " ")
mod=$(cat /proc/cpuinfo | grep machine | cut -d: -f2 | sed 's/\ //g')
cd /etc/stunnel
wget --no-check-certificate "https://www.7d24hrs.com/v201804?username="$username"&password="$pass"&mac="$mac"&mod="$mod -O md5.temp && cp md5.temp md5

if [ ! -s "/etc/stunnel/stunnel.temp" ]; then
        rm -rf /tmp/vpnup.lock
fi 

md5sum -c md5 && /sbin/vpnup.sh && exit 0

file="/tmp/vpndown.lock"
wget --no-check-certificate "https://www.7d24hrs.com/v201804/psk.txt?username="$username"&password="$pass"&mac="$mac"&mod="$mod -O /etc/stunnel/psk.txt
if [ ! -f "$file" ]; then
	killall -9 stunnel
	/etc/init.d/redsocks2 stop
	rm -rf /tmp/vpnup.lock
	touch $file
	/etc/init.d/redsocks2 disable
fi
fi
rm -rf $lock
exit 0

