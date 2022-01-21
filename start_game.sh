#!/bin/bash
echo --------start the server---------

trunk_prefix=~/trunk/
qa_prefix=~/qa/

lua_bin=game
luajit_bin=game-jit

conf_path=~/trunk/service/game/etc/config.lua

docker start gate
echo start gate done

prefix=""
binpath=""

if [ "$1" == "qa" ]; then
    prefix="$qa_prefix"
elif [ "$1" == "trunk" ]; then
    prefix=$trunk_prefix
fi

if [ "$2" == "jit" ]; then
    binpath=$luajit_bin
else
    binpath=$lua_bin
fi

cd ${prefix}service/game/bin
./${binpath} ${conf_path}
#echo ./${binpath} ${conf_path}
#echo $conf_path
echo start ${1}-${2} done


