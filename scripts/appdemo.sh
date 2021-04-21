#!/bin/bash
##&& [[$times< -le 5]]
if [ -e "../Qt_space" ];then
    cd ..
elif [ -e "../../Qt_space" ];then
    cd ../..
elif [ -e "../../../Qt_space" ];then
    cd ../../..
elif [ -e "../../../../Qt_space" ];then
    cd ../../../..
elif [ -e "../../../../../Qt_space" ];then
    cd ../../../../..
else
    echo "Qt_space not found"
    exit 2
fi
cd Qt_space/app-Release
./app
