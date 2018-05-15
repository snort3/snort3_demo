#!/usr/bin/env bats

PCAP="single.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Replace and Rewrite - test replace keyword with rewrite action" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION --Q --daq dump --daq-var load-mode=read-file > snort.out
    diff expected snort.out
    pcap-compare.py expected.pcap inline-out.pcap
}

teardown()
{
    rm -f inline-out.pcap snort.out
}

