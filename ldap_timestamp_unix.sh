#!/bin/bash
userPath="/Users/$(echo $(id -un))"  # pulls OS X user for dscl read
fileTime=$(dscl /YOURDIRSERVICE/YOURDOMAIN/All\ Domains -read $userPath | grep 'dsAttrTypeNative:lastLogon:' | awk '{print $2}') #prints stamp, lastLogon in this case
winSecs=$((($fileTime/10000000))) 
unixTimestamp=$((($winSecs-11644473600))) # converted value
unixDate=$(date -r $unixTimestamp)
echo $unixDate # output
