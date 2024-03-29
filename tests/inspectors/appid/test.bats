#!/usr/bin/env bats

PCAP="kerberos.pcap"
CFG="snort.lua"
OPTION="-A csv -k none"

@test "AppID with Kerberos Detector Plugin" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    ./appid_diff_bytes.sh
}

teardown()
{
    rm -f alert.out count.out snort.out
}
