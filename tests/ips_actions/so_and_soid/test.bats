#!/usr/bin/env bats

base=sid_3_13

pcap="cheez.pcap"
cfg="snort.lua"

gcc_opts="-std=c++11 -Wall -g -ggdb -O0 -fsanitize=address"
stub_opts="--warn-all --plugin-path ."
run_opts="-H -U -q -A csv"

setup()
{
    CXX=g++

    if [[ "$OSTYPE" == "freebsd"* ]]; then
        CXX='clang++'
    fi

    local include="${snorty_path}/include/snort"
    [ "$DAQ_INCLUDES" ] && include="$include -I$DAQ_INCLUDES"
    $snorty_path/bin/snort --rule-to-text < $base.txt > $base.h

    ${CXX} -c $gcc_opts -I$include -fPIC -o $base.o $base.cc
    ${CXX} -shared -o $base.so $base.o
}

@test "SO and SOID - 3:13" {
    $snorty_path/bin/snort $stub_opts --dump-dynamic-rules > stub.rule
    $snorty_path/bin/snort $stub_opts -c $cfg -R stub.rule -r $pcap $run_opts &> snort.out
    cat stub.rule snort.out | diff expected -
}

teardown()
{
    rm -f snort.out *.z *.o *.so stub.rule *.h
}

