#!/usr/bin/env bats

PCAP="appids_smtp.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "APPID to detect SMTP" {
    $snort -r $PCAP -c $CFG $OPTION --plugin-path $SNORT_PLUGINS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out appid_stats.log.*
}

