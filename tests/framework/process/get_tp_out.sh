#!/usr/bin/env bash

# $1 = snort.out
# $2 = expected
grep --color=no "tp_mock.cc" $1 | cut -d ':' -f2- > snort_tp_mock.out
diff $2 snort_tp_mock.out
