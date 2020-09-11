#!/usr/bin/env bats

PCAP="get.pcap"
CFG="snort.lua"
OPTION="-q -A csv"

@test "SHA256 and SHA512 - verify hash operations" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

