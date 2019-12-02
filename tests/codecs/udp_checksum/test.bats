#!/usr/bin/env bats

PCAP="ip6_cks.pcap"
OPTION="-A csv"

@test "UDP Checksum" {
    $snort -r $PCAP $OPTION > snort.out
    grep -E '^icmp|^ipv|^tcp|^udp|checksum' snort.out > checksum.out
    diff checksum.out expected
}

teardown()
{
    rm -f snort.out checksum.out
}
