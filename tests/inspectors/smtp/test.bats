#!/usr/bin/env bats

PCAP="alert_before_server_response.pcap"
CFG="snort.lua"
OPTION="-q -A csv -U -H -k none"

@test "SMTP Inspector - Long SMTP header line length and stream_udp" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
