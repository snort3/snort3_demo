#!/usr/bin/env bats

PCAP="data.pcap"
CFG="snort.lua"
# The pcap file contains packet of 36266 size. Snap length is adjusted to capture all data.
OPTIONS="-q -A csv -s 37000"
RULES="local.rules"

@test "Detection - Stateful Signature Evaluation" {
    $snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS -R $RULES $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
   rm -f snort.out
}
