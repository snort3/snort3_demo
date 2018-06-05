#!/usr/bin/env bash

PAT_BEG="Packet Statistics"
PAT_END="timing"

NUM=1000

[ -e $1 -a -e $2 ] || exit -1

grep -A $NUM "$PAT_BEG" $1 | grep -B $NUM "$PAT_END" > $1.out
grep -A $NUM "$PAT_BEG" $2 | grep -B $NUM "$PAT_END" > $2.out

diff -u $1.out $2.out

EXP=`cat $1.out`
OUT=`cat $2.out`

rm -f $1.out $2.out

[ "$EXP" = "$OUT" ]

