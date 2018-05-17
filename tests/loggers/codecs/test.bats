#!/usr/bin/env bats

PCAP="codecs.pcap"
CFG="snort.lua"
OPTIONS="-A log_codecs -q -H -U -k none"

@test "log_codecs Logger - log protocols in packet by layers" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
