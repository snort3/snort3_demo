#!/usr/bin/env bats

PCAP="one_pkt.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Detection - Trace Basic IPS Options" {
    # this test requires snort trace messages enabled by "--enable-debug-msgs" during building
    run $snort -T -c snort.lua
    if [ $status -ne 0 ];
    then
        skip "skipping if trace module is not enabled"
    fi
    $snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION --lua 'output = {wide_hex_dump = true}' > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

