#!/bin/bash
read -p"Please enter server ip: " addr
echo "starting register agent from: $addr" 
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
./nd-client -ip $addr

