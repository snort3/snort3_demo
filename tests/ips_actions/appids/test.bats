#!/usr/bin/env bats

PCAP="appids_smtp.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "APPID to detect SMTP" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION --plugin-path $SNORT_PLUGINS > snort.out 
    diff expected snort.out
}

teardown()
{
    rm -f snort.out appid_stats.log.*
}

