#!/usr/bin/env bats

PCAP="codecs.pcap"
CFG="snort.lua"
OPTIONS="-A log_codecs -q -k none"

@test "log_codecs Logger - log protocols in packet by layers" {
    $snort -r $PCAP -c $CFG $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
