#!/bin/bash
pid=`ps -ef |grep game |grep config.lua|grep -v grep|grep -v bash|grep -v vim |awk '{print $2}'`
top -Hp $pid
