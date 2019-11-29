#!/usr/bin/env bats

PCAP="dns-udp.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "DNS Inspector - rdata_overflow" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

