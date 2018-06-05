#!/usr/bin/env bats

PCAP="command23.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -l . -U -H"

@test "Event Queue and IPS" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected event_trace.txt --ignore-matching-lines "^Trace st"
}

teardown()
{
    rm -f snort.out event_trace.txt
}

