#!/bin/bash

cpu=$1
max=$2

. ./setup.sh

for pcap in $SNORT_PCAPS/* ; do
    for conf in $confs ; do
        ./repeat.sh $conf.conf $cpu $max $pcap
    done
done

