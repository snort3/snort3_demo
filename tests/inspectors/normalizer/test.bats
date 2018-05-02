#!/usr/bin/env bats

PCAP="syn_syn.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Normalizer - Alert on Normalized TCP SYN" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

