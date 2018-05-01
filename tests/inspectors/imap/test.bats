#!/usr/bin/env bats

PCAP="imap_bitenc.pcap"
CFG="snort.lua"
OPTION="-q -A csv -U -H -k none"

@test "IMAP Inspector - Bit Encoding decode depth" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
