#!/bin/bash
sleep 8s
BIN=${BIN-game-jit}
exec ./${BIN} ../etc/config.lua
