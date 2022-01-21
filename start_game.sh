#!/bin/bash
echo --------start the server---------

trunk_prefix=~/server/
qa_prefix=~/qa/

lua_path=service/game/bin/game
luajit_path=service/game/bin/game-jit

conf_path=~/server/service/game/etc/config.lua

docker start gate
echo start gate done

prefix=""
binpath=""

if ["$1" == "qa"]; then
    $prefix=$qa_prefix
elif ["$1" == "trunk"]; then
    $prefix=$trunk_prefix
fi

if ["$2" == "jit"]; then
    $binpath=$luajit_path
else
    $binpath=$lua_path
fi

${prefix}${binpath} conf_path

echo start ${prefix}${binpath} done


