#!/bin/bash

. ./setup.sh

[ -d ./rules ] || mkdir -p rules
[ -d ./logs ] || mkdir -p logs

for p in connectivity balanced security max-detect ; do
    grep -h "policy $p" $SNORT2_RULES/rules/*.rules | sed -e "s/^# alert/alert/" > rules/$p.rules
done

