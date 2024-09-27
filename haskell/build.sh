#!/bin/bash

ghc -threaded -O2 -optc-O3 -o ../bin/day1-hs ./day1.hs
rm -f day1.hi day1.o

