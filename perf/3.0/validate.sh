#!/bin/bash

. ./setup.sh

conf=$1
mpse=$2
max=$3
pcap=$4
z=$5

[ "$z" ] || z=1

echo -e "\nconf=$conf, mpse=$mpse, max=$max, pcap=$pcap, z=$z"

[ -e p ] && { echo "delete ./p"; exit -1; }
ln -s $pcap p

pcaps="p"

for i in $(seq 2 $z) ; do
    pcaps+=" p"
done

var="search_engine.search_method"

echo -e "p -> $pcap\n"
echo $snort $args -c $conf -r "\"$pcaps\"" --lua "\"$var = '$mpse'\"" -z $z -T
echo

$snort $args -c $conf -r "$pcaps" --lua "$var = '$mpse'" -z $z -T

rm -f p

