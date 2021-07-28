#!/bin/bash

mpse=$1
policies="maximum balanced connectivity security"
policies="balanced connectivity "
pcaps="defcon get250 maccdc maxcps udp1k0"
pcaps="get250 udp1k0"

[ -d logs ] || mkdir logs

for policy in $policies ; do
    for pcap in $pcaps ; do
        echo "$mpse $policy $pcap"
        ./run.sh exec $mpse $policy $pcap &> logs/${mpse}_${policy}_$pcap.log
    done
done

grep " seconds:" logs/*

