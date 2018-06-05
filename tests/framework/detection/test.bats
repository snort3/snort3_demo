#!/usr/bin/env bats

PCAP="one_pkt.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Detection - Trace Basic IPS Options" {
    $snorty_path/bin/snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

