#!/bin/bash
# 判断当前端口是否被占用，没被占用返回0，反之1
function Listening {
   TCPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "tcp" && $NF == "LISTEN" {print $0}' | wc -l`
   UDPListeningnum=`netstat -an | grep ":$1 " | awk '$1 == "udp" && $NF == "0.0.0.0:*" {print $0}' | wc -l`
   (( Listeningnum = TCPListeningnum + UDPListeningnum ))
   if [ $Listeningnum == 0 ]; then
       echo "0"
   else
       echo "1"
   fi
}


port=0
echo "port=$port"
# 得到随机端口
temp=8888
while [[ $port -eq 0 ]]; do
       #temp1=`random_range $1 $2`
    if [ `Listening $temp` -eq 0 ]; then
           port=$temp
		echo "port=$temp"
    fi
    temp=$(($temp+1))
done
echo "port=$port"
{
nfd-status-http-server -a 127.0.0.1 -p "$port"
} &
{
sleep 3
url='http://localhost:'$port
echo $url
if [[  $BROWSER -ne "" ]]; then
  echo "BROWSER = $BROWSER"
  nohup $BROWSER $url
elif which xdg-open > /dev/null; then
  nohup xdg-open $url
elif which gnome-open > /dev/null; then
  nohup gnome-open $url
else
  echo "Could not detect the web browser to use."
  sleep 10
fi
};
