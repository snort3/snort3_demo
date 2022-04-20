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
    $SED -n '/^appid/,/^----------/p' snort.out | grep -v bytes_in_use > count.out;
    $SED -n '/^detected apps and services/,/^----------/p' snort.out >> count.out;

    diff expected count.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_count" ] ; then

    let "flag++"
    $SED -n '/^appid/,/^----------/p' snort.out | grep -v bytes_in_use > count.out;
    $SED -n '/^detected apps and services/,/^----------/p' snort.out >> count.out;
    diff expected_count count.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_alert" ] ; then

    let "flag++"

    # include everything between file open/close inclusive except stuff on netboot
    $SED -n  "/++ \[/,/-- \[/p" snort.out | sed '/All pthreads started/d' | grep -Ev "(^\+\+|^--).*netboot" > alert.out;
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

#FIXIT-H: Move this to appid_threads_diff.sh
if [ -f "expected_threadstats" ] ; then

    let "flag++"
    file=$(ls -dt snort.log.* | head -1);
    file_list=$(ls "$file");

    for stats_file in $file_list;
    do
        diff $file/$stats_file expected_threadstats;
        if [ $? -ne 0 ]; then
            exit 1;
        fi
    done
fi

#Look for unique alerts
if [ -f "expected_uniq_alert" ]; then

    let "flag++"
    $SED -n -e "s/.*\(AppId:.*\)\".*/\1/p" snort.out | awk '!seen[$0]++' > snort.alert;
    diff expected_uniq_alert snort.alert
    if [ $? != 0 ] ; then exit 1 ; fi

fi

#FIXIT-H: Too many appid debug scripts. Pick one !
if [ -f "expected_dbg" ]; then

    let "flag++"

    diff -ub expected_dbg <(grep -i -E "AppIdDbg.* $1" snort.out | sort -f | uniq)
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_apps" ]; then

    let "flag++"

    cat snort.out | grep --perl-regex 'service:\s(-|)(?:[0-9]{1,4})\sclient:\s(-|)(?:[0-9]{1,4})\spayload:\s(-|)(?:[0-9]{1,4})\smisc:\s(-|)(?:[0-9]{1,4})\sreferred:\s(-|)(?:[0-9]{1,4})' > type.out
    diff -u expected_apps type.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ -f "expected_apps_json" ]; then

    let "flag++"

    grep session_num snort.out | grep service | grep dns_host > type.out
    diff -u expected_apps_json type.out
    if [ $? != 0 ] ; then exit 1 ; fi

fi

if [ $flag -eq 0 ] ; then exit 2 ; fi
