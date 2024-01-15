#!/bin/bash

if [ -f /etc/debian_version ]; then
    # get OS distribution
    OS=$(grep PRETTY_NAME /etc/os-release)
    HOSTNAME=$(hostname)
    domain=$(hostname -d)
    IP=$(hostname -I)
    MAC=$(ip link show | awk '/ether/ {print $2}')

    # check ds_agent and crowdstrike
    
    DEEP_SEC=$(sudo systemctl status ds_agent | grep active) 
    CROWDSTRIKE=$(sudo systemctl status falcon-sensor | grep active)

    # check hardware
    HARD=$(sudo dmidecode)

    # check language
    USEDLANG=$LANG
fi

touch $HOSTNAME.csv

cat<<EOF>$HOSTNAME.csv
"OS",$OS
"Hostname",$HOSTNAME
"Domain",$domain
"IP",$IP
"MAC",$MAC
"Deep Security",$DEEP_SEC
"Crowdstrike",$CROWDSTRIKE
"Hardware",$HARD
"Language",$USEDLANG
EOF
