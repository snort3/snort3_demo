#!/usr/bin/env bats

PCAP="pppoe.pcap"
CFG="snort.lua"
OPTION="-A log_codecs -q"

@test "Ethernet, IPv6, and PPoE" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
