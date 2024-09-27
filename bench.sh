#!/bin/bash

# Free the memory
# sudo sysctl vm.drop_caches=3

python3 python/day1.py input.txt
hyperfine -w 1 -r 100 'python3 python/day1.py input.txt'
hyperfine -w 1 -r 100 'julia julia/day1.jl input.txt'

hyperfine -w 1 -r 300 'gawk -f awk/day1.awk input.txt' \
                ./bin/day1-hs ./bin/day1-myr ./bin/day1-sn

hyperfine -w 1 -r 500 ./bin/day1-c ./bin/day1-c3 ./bin/day1-cpp \
                ./bin/day1-go ./bin/day1-ml ./bin/day1-nim \
                ./bin/day1-odin ./bin/day1-rs
