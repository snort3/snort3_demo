#!/usr/bin/env bats

PCAP="end_script.pcap"
CFG="snort.lua"
OPTION="-q -Q -A csv --daq dump"

@test "Script Detection - malware block in script" {
    $snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
    diff expected.pcap inline-out.pcap
}

teardown()
{
    rm -f snort.out
    rm -f inline-out.pcap
}

