#!/usr/bin/env python3

import struct
import sys

PCAP_MAGIC = 0xa1b2c3d4

def get_file_data(file):
    try:
        f = open(file, 'rb')
    except:
        print('Could not open "%s"' % (file))
        sys.exit(2)
    pcap_data = f.read()
    f.close()
    return pcap_data

def get_length(file1, pcap1, file2, pcap2):
    # Have to have at least enough for magic
    if len(pcap1) < 4:
        print('File is not a pcap: %s - short length' % (file1))
        sys.exit(2)

    if len(pcap2) < 4:
        print('File is not a pcap: %s - short length' % (file2))
        sys.exit(2)

    if len(pcap1) != len(pcap2):
        print('Pcap file lengths differ - %s:%u, %s:%u' \
            % (file1, len(pcap1), file2, len(pcap2)))
        sys.exit(1)

    return len(pcap1)

def unpack(file, fmt, data):
    try:
        args = struct.unpack(fmt, data)
    except:
        print('Pcap "%s" is truncated' % (file))
        sys.exit(2)
    return args

def get_byte_order(file, data):
    ret_fmt = None

    for fmt in ['<','>']:
        (magic,) = unpack(file, '%sI' % (fmt), data[0:4])
        if magic == PCAP_MAGIC:
            ret_fmt = fmt
            break

    if not ret_fmt:
        print('File is not a pcap: %s - bad magic' % (file))
        sys.exit(2)

    return ret_fmt

def compare_file_headers(file1, pcap1, fmt1, file2, pcap2, fmt2):
    (vmaj1, vmin1, zone1, flags1, snap1, dl1) = \
        unpack(file1, '%sHHIIII' % (fmt1), pcap1[4:24])

    (vmaj2, vmin2, zone2, flags2, snap2, dl2) = \
        unpack(file2, '%sHHIIII' % (fmt2), pcap2[4:24])

    if vmaj1 != vmaj2:
        print('Pcap file header major versions differ - %s:%u, %s:%u' \
            % (file1, vmaj1, file2, vmaj2))
        sys.exit(1)

    if vmin1 != vmin2:
        print('Pcap file header minor versions differ - %s:%u, %s:%u' \
            % (file1, vmin1, file2, vmin2))
        sys.exit(1)

    if zone1 != zone2:
        print('Pcap file header zones differ - %s:%u, %s:%u' \
            % (file1, zone1, file2, zone2))
        sys.exit(1)

    if flags1 != flags2:
        print('Pcap file header flags differ - %s:%u, %s:%u' \
            % (file1, flags1, file2, flags2))
        sys.exit(1)

    if snap1 != snap2:
        print('Pcap file header snap lengths differ - %s:%u, %s:%u' \
            % (file1, snap1, file2, snap2))
        sys.exit(1)

    if dl1 != dl2:
        print('Pcap file header link layers differ - %s:%u, %s:%u' \
            % (file1, dl1, file2, dl2))
        sys.exit(1)

def compare_packet_headers(file1, pcap1, fmt1, file2, pcap2, fmt2, offset, pkt_num):
    (sec1, usec1, incl1, orig1) = \
        unpack(file1, '%sIIII' % (fmt1), pcap1[offset:offset+16])

    (sec2, usec2, incl2, orig2) = \
        unpack(file2, '%sIIII' % (fmt2), pcap2[offset:offset+16])

    if sec1 != sec2:
        print('Pcap packet %d seconds differ - %s:%u, %s:%u' \
            % (pkt_num, file1, sec1, file2, sec2))
        sys.exit(1)

    if usec1 != usec2:
        print('Pcap packet %d microseconds differ - %s:%u, %s:%u' \
            % (pkt_num, file1, usec1, file2, usec2))
        sys.exit(1)

    if incl1 != incl2:
        print('Pcap packet %d captured lengths differ - %s:%u, %s:%u' \
            % (pkt_num, file1, incl1, file2, incl2))
        sys.exit(1)

    if orig1 != orig2:
        print('Pcap packet %d original lengths differ - %s:%u, %s:%u' \
            % (pkt_num, file1, orig1, file2, orig2))
        sys.exit(1)

    return incl1


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: %s <pcap1> <pcap2>' % (sys.argv[0]))
        sys.exit(1)

    file1 = sys.argv[1]
    file2 = sys.argv[2]

    pcap1 = get_file_data(file1)
    pcap2 = get_file_data(file2)

    # Compare and get pcap lengths
    pcap_len = get_length(file1, pcap1, file2, pcap2)

    # Get byte order of pcap
    fmt1 = get_byte_order(file1, pcap1)
    fmt2 = get_byte_order(file2, pcap2)

    # Compare file header
    compare_file_headers(file1, pcap1, fmt1, file2, pcap2, fmt2)

    # Compare packets
    i = 0
    offset = 24
    while offset < pcap_len:
        i += 1   # keep track of packet number

        # Compare packet header
        caplen = compare_packet_headers(file1, pcap1, fmt1, file2, pcap2, fmt2, offset, i)

        # The packet bytes should be the same
        offset += 16
        if pcap1[offset:offset+caplen] != pcap2[offset:offset+caplen]:
            print('Pcap packet %d data differs' % (i))
            sys.exit(1)
        offset += caplen
