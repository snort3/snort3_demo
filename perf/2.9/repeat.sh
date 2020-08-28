#!/bin/bash

. ./setup.sh

conf=$1
cpu=$2
num=$3
pcap=$4

data="conf, cpu, num, pcap"

for i in $(seq 1 $num) ; do
    data+=", run$i"
done

data+=", min, max, avg"
printf "# $data\n"
printf "`basename $conf .conf`, $cpu, $num, `basename $pcap .pcap`"

min=99999
max=0
sum="0"

for i in $(seq 1 $num) ; do
    x=`taskset -c "$cpu" $snort $args -c $conf $vars -r $pcap 2>&1 | grep "$runt" | grep -o '[0-9\.]*'`
    printf ", $x"
    sum+="+$x"
    if (( $(echo "$x < $min" | bc -l) )) ; then min=$x ; fi
    if (( $(echo "$x > $max" | bc -l) )) ; then max=$x ; fi
done

avg=`echo "scale=3; ($sum)/$num" | bc -l`
printf ", $min, $max, $avg\n"

