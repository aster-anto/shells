#!/bin/bash
wpa_passphrase $2 $3 > /etc/wpa.conf
chmod -v 600 /etc/wpa.conf
cat /etc/wpa.conf
wpa_supplicant -Dnl80211,wext -i$1 -c/etc/wpa.conf -B
