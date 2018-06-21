#!/usr/bin/env bats

PCAP="so_soid_18758.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

setup()
{
    CXX=g++

    if [[ "$OSTYPE" == "freebsd"* ]]; then
        CXX='clang++'
    fi

    include="${snorty_path}/include/snort"

    base=sid_18758

    $snorty_path/bin/snort --rule-to-text < $base.txt > $base.h

    ${CXX} -c -std=c++11 -I$include -fPIC -o $base.o $base.cc
    ${CXX} -shared -o $base.so $base.o
}

@test "SO and SOID - rule with GID:3 and SID:18758" {
    $snorty_path/bin/snort --plugin-path . --dump-dynamic-rules > stub.txt
    $snorty_path/bin/snort --plugin-path . -r $PCAP -c $CFG -R stub.txt $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out *.z *.o *.so stub.txt *.h
}

