#!/bin/bash
if ! sudo true
then
  echo 'Unable to obtain superuser privilege'
  exit 2
fi
sudo nfd-start
