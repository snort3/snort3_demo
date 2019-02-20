#!/bin/bash

. ./setup.sh

conf=$1
cpu=$2
max=$3
pcap=$4

echo "conf=$conf, cpu=$cpu, max=$max, pcap=$pcap"

for i in $(seq 1 $max) ; do
    echo $i `taskset $cpu $snort $args -c $conf -r $pcap -n 1 2>&1 | grep "$runt" | grep -o '[0-9\.]*'`
    #taskset $cpu $snort $args -c $conf -r $pcap
done

