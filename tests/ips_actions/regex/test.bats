#!/usr/bin/env bats

PCAP="get.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Regex - Basic Functionality" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

