#!/usr/bin/env bats

CFG="snort.lua"
OPTION="-T -v"

@test "inspectors verbose startup output" {
    [ -f $SNORT_PLUGINS/extra/inspectors/data_log.so ]
    [ -f $SNORT_PLUGINS/extra/inspectors/domain_filter.so ]
    $snort --plugin-path $SNORT_PLUGINS -c $CFG $OPTION > snort.out
    sed -n '/^Finished/,/^Snort successfully validated/p' snort.out |
        sed -E -e '/^stream:$/,/^-+$/ {' \
            -e '/^[[:space:]]*footprint:/d' \
            -e 's/, test_force_enable = (true|false)//' \
            -e '}' |
        diff expected -
}

teardown()
{
    rm -f snort.out
}
