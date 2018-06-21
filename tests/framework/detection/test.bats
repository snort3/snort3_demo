#!/usr/bin/env bats

PCAP="one_pkt.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Detection - Trace Basic IPS Options" {
    skip "this test requires snort trace messages enabled by --enable-debug-msgs"
    $snorty_path/bin/snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION --lua 'output = {wide_hex_dump = true}' > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

