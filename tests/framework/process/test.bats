#!/usr/bin/env bats

PCAP="cnnf.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Process - AppId third party plugin" {
    $snorty_path/bin/snort -r $PCAP -c $CFG --plugin-path $SNORT_PLUGINS $OPTION > snort.out
    run ./get_tp_out.sh snort.out expected
}

teardown()
{
    rm -f snort.out snort_tp_mock.out
}

