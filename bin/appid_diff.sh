#! /usr/bin/env bash

SED='sed'

if [[ "$OSTYPE" == "freebsd"* ]]; then
   SED='gsed'
fi

flag=0; # Flag to make sure atleast there is one file to compare output with
        # and script don't provide false positive if there no file to compare.

if [ -f "expected" ] ; then 

    let "flag++"
    x=$(wc -l < "expected") ; let "x--" # Removing one line from total count
                                        # as it also contain match string
    $SED -n '/^appid/,/^----------/p' snort.out > count.out;
    $SED -n '/^Appid dynamic stats/,/^----------/p' snort.out >> count.out;   

    diff expected count.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_count" ] ; then 
    
    let "flag++"
    $SED -n '/^appid/,/^----------/p' snort.out > count.out;
    $SED -n '/^Appid dynamic stats/,/^----------/p' snort.out >> count.out;   
    diff expected_count count.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_alert" ] ; then 

    let "flag++"

    # include everything between file open/close inclusive except stuff on netboot
    $SED -n  "/++ \[/,/-- \[/p" snort.out | grep -Ev "(^\+\+|^--).*netboot" > alert.out;
    $SED -i '/No Entry For AppId\|Detected AppId\|Detector\|Stats\|appid_stats/d' alert.out

    diff expected_alert alert.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_blacklist" ] ; then 

    let "flag++"
    $SED -n '/^daq/,/^----------/p' snort.out > blacklist.out;   

    diff expected_blacklist blacklist.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ $flag -eq 0 ] ; then exit 2 ; fi
