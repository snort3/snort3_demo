#!/usr/bin/env bats

PCAP="cnnf.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "Process - AppId third party plugin" {
    $snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION &> snort.out
    ./get_tp_out.sh snort.out expected
}

teardown()
{
    rm -f snort.out snort_tp_mock.out
}

