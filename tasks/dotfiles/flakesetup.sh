#!/usr/bin/env bash

flakename=$1

echo $flakename

if [ -e "./flake.nix" ]; then
    echo "Already setup"
else
    cp ~/nixc/src/flakes/${flakename}/flake.* ./
fi

nix develop . --command zsh
