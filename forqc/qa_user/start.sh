#!/bin/bash
etc_path=~/server/service/game/etc
game_path=~/server/service/game/bin
map=$1
itype=$2 -- 1 加入联盟
arg1=$3  -- itype 1, num
arg2=$4  -- itype 1, uid

cd $etc_path
rm -f robot_qa.lua
lua tool_robot.lua $1 $2 $3 $4

cd $game_path
./game ../etc/robot_qa.lua
