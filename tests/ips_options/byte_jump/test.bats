#!/usr/bin/env bats

PCAP="sadmind.pcap"
CFG="snort.lua"
OPTION="-q -A csv"

@test "Byte Jump" {
    $snort -c $CFG -R sadmind.rules $OPTION -r $PCAP > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

