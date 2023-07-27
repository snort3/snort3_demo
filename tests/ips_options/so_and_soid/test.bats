#!/usr/bin/env bats

base=sid_3_13

pcap="cheez.pcap"
cfg="snort.lua"

stub_opts="--warn-all --plugin-path so_rule/install"
run_opts="-q -A csv"

setup()
{
    pushd so_rule/
    make sid_3_13.h build install
    popd
    ls -alh so_rule/install
}

@test "SO and SOID - 3:13" {
    echo $snort $stub_opts --dump-dynamic-rules > stub.rule
    $snort $stub_opts --dump-dynamic-rules > stub.rule

    echo $snort $stub_opts -c $cfg -R stub.rule -r $pcap $run_opts &> snort.out
    $snort $stub_opts -c $cfg -R stub.rule -r $pcap $run_opts &> snort.out

    cat snort.out
    cat stub.rule snort.out | diff expected -
}

teardown()
{
    pushd so_rule/
    make clean
    popd
    rm -f snort.out stub.rule
}
