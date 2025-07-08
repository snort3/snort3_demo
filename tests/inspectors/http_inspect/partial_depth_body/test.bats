#!/usr/bin/env bats

PCAP="bad_content_length.pcap"
CFG="snort.lua"
OPTION="-q -Q -A csv --daq dump"

@test "Partial depth body - malware block in post request with bad content length" {
    $snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
    diff expected.pcap inline-out.pcap
}

teardown()
{
    rm -f snort.out
    rm -f inline-out.pcap
}

