#!/bin/bash
docker kill --signal="SIGQUIT" game
docker kill --signal="SIGQUIT" game2
busy=`ps -ef |grep game |grep config.lua|grep -v grep|grep -v bash|grep -v vim`
while [ "$busy" != "" ]; do
    echo 正在关服保存数据中，请耐心等候
    sleep 1
    busy=`ps -ef |grep game |grep config.lua|grep -v grep|grep -v bash|grep -v vim`
done
cd server
svn up
cd ..
docker start game
docker start game2
