#!/bin/bash

session_exist=`tmux list-session`
echo $session_exist

if [ "${session_exist}" == "" ]; then
    echo "sessions were quitted"
else
    echo "sessions are normal"
fi
