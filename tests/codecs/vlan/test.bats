#!/usr/bin/env bats

PCAP="double_tagging_0x88A8_0x8100.pcap"
CFG="snort.lua"
OPTION="-A csv -k none -q"

@test "VLAN decoder" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
