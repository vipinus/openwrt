#!/bin/sh

cp /etc/hosts.temp /etc/hosts                                                                                                       
nslookup www.netflix.com 127.0.0.1 | grep Address | grep '\.' | grep -v 127.0.0.1 | awk '{print $3,"www.netflix.com"}' >> /etc/hosts                              
/etc/init.d/dnsmasq restart                                                                                                                                       
nslookup www.netflix.com 127.0.0.1 | grep Address | grep '\.' | grep -v 127.0.0.1 | awk '{print "iptables -t nat -I zone_lan_prerouting -p tcp -d "$3"/32 -j REDIRECT --to-ports 12345"}' | sh
