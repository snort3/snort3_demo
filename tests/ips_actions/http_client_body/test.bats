#!/usr/bin/env bats

PCAP="hex-all-vars_post-POST-chunk_2.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "HTTP Client Body - parameter extraction and normalization with %u encoding" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

