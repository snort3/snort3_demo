#!/bin/bash

. ./setup.sh

conf=$1
mpse=$2
num=$3
pcap=$4
z=$5

[ "$z" ] || z=1

var="search_engine.search_method"
data="conf, mpse, num, pcap, z"

for i in $(seq 1 $num) ; do
    data+=", run$i"
done

data+=", min, max, avg"
printf "# $data\n"
printf "`basename $conf .lua`, $mpse, $num, `basename $pcap .pcap`, $z"

min=99999
max=0
sum="0"

for i in $(seq 1 $num) ; do
    x=`$snort $args -c $conf -r $pcap --lua "$var = '$mpse'" -z $z --pcap-loop $z 2>&1 3>/dev/null | \
        grep "$runt" | grep -o '[0-9.]*'`
    printf ", $x"
    sum+="+$x"
    if (( $(echo "$x < $min" | bc -l) )) ; then min=$x ; fi
    if (( $(echo "$x > $max" | bc -l) )) ; then max=$x ; fi
done

avg=`echo "scale=3; ($sum)/$num" | bc -l`
printf ", $min, $max, $avg\n"

