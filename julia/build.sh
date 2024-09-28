#!/bin/bash

# julia
# > using Pkg
# > Pkg.add("StaticArrays")
# > Pkg.add("StaticCompiler")
# > Pkg.add("StaticTools")

# julia --project=. -L 'Day01.jl' -e 'using StaticCompiler,; compile_executable(Day01.main, ())'
