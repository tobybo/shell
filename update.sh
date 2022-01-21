#!/bin/bash

prefix=$1

path=~/${prefix}/

cd $path
svn up
cd service/game/script/proto
./protoc --descriptor_set_out=descriptor.bytes *.proto
