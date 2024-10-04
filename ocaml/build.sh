#!/bin/bash

# sudo apt install -y opam
# opam init
# opam install ocaml dune
# opam install base core stdio

dune clean && dune build @fmt
dune promote && dune build --release --force --verbose
\cp -f _build/default/bin/main.exe ../bin/day1-ml
