#!/bin/bash

cpu=1
policies="maximum balanced connectivity security"
pcaps="defcon get250 maccdc maxcps udp1k0"

for policy in $policies ; do
    for pcap in $pcaps ; do
        echo "$policy $pcap"
        ./run.sh $cpu $policy $pcap &> logs/${policy}_$pcap.log
    done
done

grep "Run time" logs/*

