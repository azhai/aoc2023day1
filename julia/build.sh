#!/bin/bash

# julia
# > using Pkg
# > Pkg.add("StaticCompiler")
# > Pkg.add("StaticTools")

# julia --project=. -L 'day1.jl' -e 'using StaticCompiler,; compile_executable(Day1.main, ())'
