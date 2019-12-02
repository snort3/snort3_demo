#!/usr/bin/env bats

PCAP="ip0-tcp0-dce0.pcap"
CFG="snort.lua"
OPTION="-k none"

@test "DCE TCP traffic verified by wizard" {    
    $snort -c $CFG -r $PCAP $OPTION | sed -n '/dce_tcp/,/---/p' | grep 'sessions:\|packets:' > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

