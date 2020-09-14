#!/usr/bin/env bats

PCAP="cd_tcp.pcap"
CFG="snort.lua"
OPTION="-q -A csv"

@test "TCP - Builtin decoder rule 116:433" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
