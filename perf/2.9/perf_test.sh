#!/bin/bash

cpu=$1
max=$2

. ../common/setup.sh

for pcap in $pcaps/* ; do
    for conf in $confs ; do
        ./repeat.sh $conf.conf $cpu $max $pcap
    done
done

