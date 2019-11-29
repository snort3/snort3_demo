#!/usr/bin/env bats

PCAP="http2-test.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "HTTP2 Inspector http2_frame_header and http2_frame_data buffer match test" {
    $snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

