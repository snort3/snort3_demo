#!/usr/bin/env bats

PCAP="flows.pcap"
CFG="snort.lua"
OPTION="-q -A csv"

@test "Wizard" {
    $snort -c $CFG $OPTION -r $PCAP > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

