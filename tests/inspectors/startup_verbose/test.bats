#!/usr/bin/env bats

CFG="snort.lua"
OPTION="-T -v"

@test "inspectors verbose startup output" {
    $snort --plugin-path $SNORT_PLUGINS -c $CFG $OPTION > snort.out
    sed -n '/^Finished/,/^Snort successfully validated/p' snort.out | diff expected -
}

teardown()
{
    rm -f snort.out
}

