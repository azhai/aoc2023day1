#!/bin/bash

# sudo apt install -y opam
# opam init
# opam install ocaml dune
# opam install base core stdio

dune clean && dune build --release
\cp -f _build/install/default/bin/day1 ../bin/day1-ml
