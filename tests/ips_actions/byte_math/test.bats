#!/usr/bin/env bats

PCAP="byte_math.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H -s 8274"

@test "Byte Math - ADD operator" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

