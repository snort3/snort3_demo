#!/bin/bash

. ./setup.sh

conf=$1
mpse=$2
max=$3
pcap=$4
z=$5

[ "$z" ] || z=1

echo "conf=$conf, mpse=$mpse, max=$max, pcap=$pcap, z=$z"

[ -e p ] && exit -1
ln -s $pcap p

pcaps="p"

for i in $(seq 2 $z) ; do
    pcaps+=" p"
done

exp="0"
var="search_engine.search_method"

for i in $(seq 1 $max) ; do
    #$snort $args -c $conf -r "$pcaps" --lua "$var = '$mpse'" -z $z
    x=`$snort $args -c $conf -r "$pcaps" --lua "$var = '$mpse'" -z $z 2>&1 | \
        grep "$runt" | grep -o '[0-9.]*'`
    echo "$i $x"
    exp+="+$x"
done

avg=`echo "scale=3; ($exp)/$max" | bc -l`
echo "avg $avg"

rm -f p

