#!/usr/bin/env bash

echo starting

pushd ~/nixc/ || exit

# nix requires all files in the directory to be either commited or staged
git add --all

echo ====================== Running home-manager ======================
# home-manager switch --impure --flake . -b backup --show-trace -L -v
nh home switch ~/nixc

if [[ $? -eq 0 ]]; then
    echo Sync successful
else
    echo Home manager failed. Aborting...
fi

popd || exit
