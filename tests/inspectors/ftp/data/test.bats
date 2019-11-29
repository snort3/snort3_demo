#!/usr/bin/env bats

PCAP="malware_mac.doc.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H --daq dump --daq-var output=none --daq-var load-mode=read-file -Q"
@test "FTP file - mac doc" {

    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected file.log
}

teardown()
{
    rm -f inline-out.* snort.out file.log
}
