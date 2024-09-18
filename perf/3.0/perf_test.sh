#!/bin/bash

. ./setup.sh

mpse=$1
max=$2
thr="$3"

[ "$thr" ] || thr="1"
[ "$4" ] && confs="$4"

for z in $thr ; do
    for pcap in $SNORT_PCAPS/* ; do
        for conf in $confs ; do
            ./repeat.sh $conf.lua $mpse $max $pcap $z
        done
    done
done


for z in $thr ; do
    for scenario in "${scenarios[@]}" ; do
        scenario_array=($scenario)
        for (( p=1; p<${#scenario_array[*]}; p++ )) ; do
            ./repeat.sh ${scenario_array[0]}.lua $mpse $max $SNORT_PCAPS/${scenario_array[$p]}.pcap $z
        done
    done
done
