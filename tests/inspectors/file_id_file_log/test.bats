#!/usr/bin/env bats

PCAP="http_noblock.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "File ID and File Data - HTTP No Block" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected file.log
}

teardown()
{
    rm -f file.log snort.out 
}

