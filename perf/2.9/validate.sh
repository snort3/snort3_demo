#!/bin/bash

. ./setup.sh

conf=$1
cpu=$2
max=$3
pcap=$4

echo -e "\nconf=$conf, cpu=$cpu, max=$max, pcap=$pcap\n"
echo -e "command: taskset $cpu $snort $args -c $conf $vars -r $pcap -T\n"

taskset $cpu $snort $args -c $conf $vars -r $pcap -T

