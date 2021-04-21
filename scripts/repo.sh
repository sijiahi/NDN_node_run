#!/bin/bash
conf_file=''
if [ -e 'conf_files/repo-ng.conf' ];then
 conf_file='conf_files/repo-ng.conf'
elif [ -e 'scripts/conf_files/repo-ng.conf' ];then
 conf_file='scripts/conf_files/repo-ng.conf'
else
 echo "cannot find conf file"
 exit 2
fi
pwd
echo $conf_file 
ndn-repo-ng -c $conf_file
