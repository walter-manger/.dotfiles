#!/usr/bin/env bash


if [ "$GOPACKAGESDRIVER" = "off" ]
then
    export GOPACKAGESDRIVER="/Users/wmanger-videoamp/repos/work/VideoAmp/central/tools/bazel/go/gopackagesdriver.sh"
    echo $GOPACKAGESDRIVER
else
    export GOPACKAGESDRIVER="off"
    echo $GOPACKAGESDRIVER
fi
