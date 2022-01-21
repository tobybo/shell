#!/bin/bash
echo --------start to stop the server---------

log_path=~/server/log/game

docker stop gate
echo stop gate done

kill -3 -f game
busy=`ps -ef |grep game |grep config.lua|grep -v grep|grep -v bash|grep -v vim`
while [ "$busy" != "" ]; do
    echo game is saving data, wait a moument...
    sleep 1
    busy=`ps -ef |grep game |grep config.lua|grep -v grep|grep -v bash|grep -v vim`
done
echo stop game done

if ["$1" == "1"]; then
    echo start to drop databases
    docker exec -it mongo mongo 10.23.0.50:27017/yace_1 --eval "db.dropDatabase()"
    docker exec -it mongo mongo 10.23.0.50:27017/yace_G --eval "db.dropDatabase()"
    echo drop databases done
fi

if ["$2" == "1"]; then
    rm -irf $log_path
    echo rm logs done
fi


