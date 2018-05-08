#!/usr/bin/env bats

PCAP="ipv4.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Reputation - test to blacklist IPv4" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

