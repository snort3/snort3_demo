#!/bin/bash

. ./setup.sh

conf=$1
cpu=$2
max=$3
pcap=$4

echo "conf=$conf, cpu=$cpu, max=$max, pcap=$pcap"

exp="0"

for i in $(seq 1 $max) ; do
    #taskset $cpu $snort $args -c $conf $vars -r $pcap
    x=`taskset $cpu $snort $args -c $conf $vars -r $pcap 2>&1 | grep "$runt" | grep -o '[0-9\.]*'`
    echo "$i $x"
    exp+="+$x"
done

avg=`echo "scale=3; ($exp)/$max" | bc -l`
echo "avg $avg"

