#!/bin/bash

platform=$1

if [ -f "sdcard-$platform.img" ]; then
  rm sdcard-$platform.img
fi
cd ./testcases
./make_img.sh $platform
cd ..
mv ./testcases/sdcard-$platform.img ./
