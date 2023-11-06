#!/bin/sh

#Get enterprise numbers
curl https://www.iana.org/assignments/enterprise-numbers.txt -o /usr/share/misc/enterprise-numbers.txt

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E sdr list full
else
    exec $@
fi
