#!/bin/bash
##&& [[$times< -le 5]]
if [ -e "../NDND" ];then
    cd ..
elif [ -e "../../NDND" ];then
    cd ../..
elif [ -e "../../../NDND" ];then
    cd ../../..
elif [ -e "../../../../NDND" ];then
    cd ../../../..
elif [ -e "../../../../../NDND" ];then
    cd ../../../../..
else
    echo "NDND not found"
    exit 2
fi
cd NDND
./nd-server
