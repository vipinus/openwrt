#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
cp -r files/* openwrt/
chmod +x openwrt/package/base-files/files/etc/rc.local
chmod +x openwrt/package/base-files/files/etc/crontabs/root
chmod +x openwrt/package/base-files/files/sbin/*
