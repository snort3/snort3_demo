#!/bin/bash

cps=$1

for i in `seq 1 $cps` ; do
    a=$((10000+i))
    echo "f$i:d ( stack=\"eth:ip4:tcp\" )"
    echo "f$i:c ( 4:a=$a, b=80, b.data=\"*\" )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( syn, win=32768, mss=1460 )"
    echo "f$i:b ( syn, ack, win=32768, mss=1460 )"
    echo "f$i:a ( ack )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( ack, pay="
    echo "    \"GET /1M HTTP/1.1|d a|\""
    echo "    \"Host: 10.1.2.3|d a|\""
    echo "    \"Connection: close|d a|\""
    echo "    \"User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 8.0|d a|\""
    echo "    \"Accept: */*|d a|\""
    echo "    \"Accept-Language: en-us|d a|\""
    echo "    \"Accept-Encoding: gzip, deflate, compress|d a|\""
    echo "    \"|d a|\" )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:b ( ack, pay="
    echo "    \"HTTP/1.1 200 OK|d a|\""
    echo "    \"Date: Sat, 01 Jun 2019 16:56:09 GMT|d a|\""
    echo "    \"Server: Jetty/4.2.9rc2 (SunOS/5.8 sparc java/1.4.1_04)|d a|\""
    echo "    \"Content-Type: text/html|d a|\""
    echo "    \"Connection: close|d a|\""
    echo "    \"Content-Length: 256960|d a|\""
    echo "    \"|d a|\" )"
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

