#!/usr/bin/env bats

PCAP="mpls_ip4_tcp.pcap"
CFG="snort.lua"
OPTIONS="-y -q -A u2 -U -H -k none"

@test "unified2 Logger - output event in unified2 format file" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTIONS
    $snorty_path/bin/u2spewfoo unified2.log > snort.out
    diff expected snort.out 
} 

teardown()
{
    rm -f snort.out unified2.log
}
