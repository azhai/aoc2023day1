#!/bin/bash

nim c -d:release ./day1.nim
rm -f ../bin/day1-nim
mv day1 ../bin/day1-nim
