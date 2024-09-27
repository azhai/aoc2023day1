#!/bin/bash

sudo apt install -y liblld-17-dev libpolly-17-dev
odin build day1.odin -file -o:speed -out:../bin/day1-odin
