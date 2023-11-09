#! /bin/sh

echo "Turn off auto fan control (Set Manual)"
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x01 0x00
sleep 1

echo "Set core fan speed to 10%"
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x00 0x10
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x01 0x10
sleep 1

echo "Set mid fans to 15%"
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x02 0x15
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x03 0x15
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x04 0x15
sleep 1

echo "Set front fans to 20% and wait for effect"
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x05 0x20
ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E raw 0x30 0x30 0x02 0x06 0x20
sleep 5

ipmitool -I lanplus -H $IPMI_HOSTNAME -U root -E sdr list full
