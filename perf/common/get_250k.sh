#!/bin/bash

cps=$1

for i in `seq 1 $cps` ; do
    a=$((10000+i))
    echo "f$i:d ( stack=\"eth:ip4:tcp\" )"
    echo "f$i:c ( 4:a=$a, b=80, b.data=\"*\" )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( syn )"
    echo "f$i:b ( syn, ack )"
    echo "f$i:a ( ack )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( ack, pay=\"GET 250K HTTP/1.1|d a d a|\" )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:b ( ack, pay=\"HTTP/1.1 200 OK|d a|Content-Length: 256960|d a d a|\" )"
done

for j in `seq 1 88` ; do
    for i in `seq 1 $cps` ; do
        echo "f$i:b ( ack, len=1460 )"
        echo "f$i:b ( ack, len=1460 )"
        echo "f$i:a ( ack )"
    done
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( fin, ack )"
    echo "f$i:b ( fin, ack )"
    echo "f$i:a ( ack )"
done

