#!/usr/bin/env bats

PCAP="cd_tcp.pcap"
CFG="snort.lua"
OPTION="-A csv -k none"

@test "TCP - Builtin decoder rule 116:433" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    run ./diff-outpp.sh expected snort.out
}

teardown()
{
    rm -f snort.out
}
