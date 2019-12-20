#!/usr/bin/env python

import socket
from binascii import hexlify
import re 
import sys

def IPV6_to_hex(ipv6_addr):
    try:
        ret = hexlify(socket.inet_pton(socket.AF_INET6, ipv6_addr))
    except socket.error:
        ret = ipv6_addr

    return ret

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print 'Usage: %s <filename>' % (sys.argv[0])
        sys.exit(1)

    filename = sys.argv[1]
    text = open(filename).read()

    matches = re.findall(r'\"(.+?)\"',text)
    for m in matches:
        text = text.replace(m, IPV6_to_hex(m))

    print text
