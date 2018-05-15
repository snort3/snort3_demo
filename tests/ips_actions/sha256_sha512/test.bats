#!/usr/bin/env bats

PCAP="get.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "SHA256 and SHA512 - verify hash operations" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

