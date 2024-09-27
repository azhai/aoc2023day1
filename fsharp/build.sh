#!/bin/bash

# sudo apt install -y dotnet-sdk-8.0

rm -rf bin/ obj/ && dotnet clean
dotnet build -c Release
cd ../bin/
ln -sf ../fsharp/bin/Release/net8.0/linux-x64/aoc2023 day1-fs
cd -
