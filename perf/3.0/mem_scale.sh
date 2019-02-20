#!/bin/bash

. ./setup.sh

conf=$1
mpse=$2
max=$3
pcap=$4

echo "conf=$conf, cpu=$cpu, max=$max, pcap=$pcap"

var="search_engine.search_method"
pcaps="$pcap"

for i in $(seq 2 $max) ; do
    pcaps+=" $pcap"
done

echo $i `$snort $args -c $conf -r "$pcaps" --lua "$var = '$mpse'" -z $max 2>&1 | \
    grep "$runt" | grep -o '[0-9.]*'`

#$snort $args -c $conf -r $pcaps --lua "$cpus; $var = '$mpse'" -z $i

