#!/bin/bash

. ./setup.sh

conf=$1
mpse=$2
max=$3
pcap=$4
z=$5

[ "$z" ] || z=1

echo -e "\nconf=$conf, mpse=$mpse, max=$max, pcap=$pcap, z=$z"

var="search_engine.search_method"

echo $snort $args -c $conf -r $pcap --lua "\"$var = '$mpse'\"" -z $z --pcap-loop $z -T
echo

$snort $args -c $conf -r $pcap --lua "$var = '$mpse'" -z $z --pcap-loop $z -T

