#!/usr/bin/env bats

CFG="snort.lua"
OPTION="-A csv -k none -U -H"

@test "Basic stream_user functional test" {
    $snort -c $CFG --daq-dir $SNORT_DAQS --daq hext -i get.hext $OPTION > snort.log
    egrep user snort.log > snort.out
    sed  -n '/^stream/,/^----------/p' snort.log >> snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.log
    rm -f snort.out
}
