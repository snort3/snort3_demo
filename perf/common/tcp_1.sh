#!/bin/bash

# to get a 1 GB pcap, you can change the script to iterate over ip addresses
# or just repeat this multiple times like this:

# ./tcp_1.sh 50000 | abcip --pcap p
# mergecap -a -w p16 p p p p p p p p p p p p p p p p
# editcap -S 0.00001 p16 maxcps.pcap

cps=$1

for i in `seq 1 $cps` ; do
    a=$((10000+i))
    echo "f$i:d ( stack=\"eth:ip4:tcp\" )"
    echo "f$i:c ( 4:a=$a, b=80, b.data=\"*\" )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( syn, win=32768, mss=220 )"
    echo "f$i:b ( syn, ack, win=32768, mss=220 )"
    echo "f$i:a ( ack )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( ack, pay="
    echo "    \"GET /11K HTTP/1.1|d a|\""
    echo "    \"Host: 10.1.2.3|d a|\""
    echo "    \"Connection: close|d a|\""
    echo "    \"User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) Opera 8.0|d a|\""
    echo "    \"Accept: */*|d a|\""
    echo "    \"Accept-Language: en-us|d a|\""
    echo "    \"Accept-Encoding: gzip, deflate, compress|d a|\""
    echo "    \"|d a|\" )"
    echo "f$i:b ( ack )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:b ( ack, pay="
    echo "    \"HTTP/1.1 200 OK|d a|\""
    echo "    \"Date: Sat, 01 Jun 2019 16:56:09 GMT|d a|\""
    echo "    \"Server: Jetty/4.2.9rc2 (SunOS/5.8 sparc java/1.4.1_04)|d a|\""
    echo "    \"Content-Type: text/html|d a|\""
    echo "    \"Connection: close|d a|\""
    echo "    \"Content-Length: 1|d a|\""
    echo "    \"|d a|\" )"
    echo "f$i:a ( ack )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:b ( ack, len=1 )"
    echo "f$i:a ( ack )"
done

for i in `seq 1 $cps` ; do
    echo "f$i:a ( fin, ack )"
    echo "f$i:b ( fin, ack )"
    echo "f$i:a ( ack )"
done

