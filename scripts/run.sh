#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E sdr list full
else
    exec $@
fi
