#!/bin/bash

mpse=$1
max=$2
thr="$3"

[ "$thr" ] || thr="1"

. ../common/setup.sh

for z in $thr ; do
    for pcap in $pcaps/* ; do
        for conf in $confs ; do
            ./repeat.sh $conf.lua $mpse $max $pcap $z
        done
    done
done

