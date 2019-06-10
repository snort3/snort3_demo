#!/bin/bash

cps=$1

for i in `seq 1 $cps` ; do
    a=$((10000+i))
    echo "f$i:d ( stack=\"eth:ip4:udp\" )"
    echo "f$i:c ( 4:a=$a, b=1024, b.data=\"0\" )"
done

for j in `seq 1 7` ; do
    for i in `seq 1 $cps` ; do
        echo "f$i:b ( len=408 )"
        echo "f$i:b ( len=408 )"
    done
done

