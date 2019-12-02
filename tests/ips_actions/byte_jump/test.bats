#!/usr/bin/env bats

PCAP="byte_jump_post_offset_neg_value.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Byte Jump - Post Offset Negative Value" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

