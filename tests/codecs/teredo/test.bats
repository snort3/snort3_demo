#!/usr/bin/env bats

PCAP="teredo.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "teredo" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

@test "network ip layer test" {
    $snort -r $PCAP -c $CFG $OPTION --lua 'network= {max_ip_layers = 1}' > snort.out
    diff expected2 snort.out
}

teardown()
{
    rm -f snort.out
}
