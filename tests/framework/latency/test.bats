#!/usr/bin/env bats

PCAP="icmp_echo_test.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Latency - Fastpath enabled" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

