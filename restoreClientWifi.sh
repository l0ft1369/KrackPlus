#!/bin/bash

#This script should restore wifi to a wireless interface that is in monitoring mode. 

nmcli radio wifi on

systemctl start NetworkManager

wlanName=$(ifconfig -a | sed 's/[ \t].*//;/^$/d' | awk 'FNR==3' | tr -d ':')

ifconfig $wlanName down
iwconfig $wlanName mode managed
ifconfig $wlanName up

# TODO check whether the wlan interfaces are back up; if not, advice user to remove their external NIC and click a button to run this script again. 
