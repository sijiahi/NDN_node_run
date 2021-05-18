#!/bin/bash
if ! sudo true
then
  echo 'Unable to obtain superuser privilege'
  exit 2
fi
sudo gnome-terminal -t "nfd-runner" -x bash -c "sudo bash scripts/nfd.sh;exec bash;"
sleep 3
gnome-terminal -t "repo" -x bash -c " bash scripts/repo.sh;exec bash;"
gnome-terminal --window -x bash -c " bash scripts/webpage.sh;exec bash;"
gnome-terminal -t "server" -x bash -c " bash scripts/registerServer.sh;exec bash;"
gnome-terminal -t "client" -x bash -c " bash scripts/registerClient.sh;exec bash;"

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
fi
cd Qt_space/app-Release
./app
