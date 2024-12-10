#!/usr/bin/env bash

sudo echo starting

pushd ~/nixc/ || exit
alejandra . &>/dev/null
git diff -U0 *.nix

# nix requires all files in the directory to be either commited or staged
git add --all

echo ====================== Running home-manager ======================
home-manager switch --impure --flake . -b backup --show-trace -L -v

if [[ $? -eq 0 ]]; then
    echo ====================== Running nixos-rebuild ======================
    sudo nixos-rebuild switch --flake .#desktop --show-trace -L -v 
    
    if [[ $? -eq 0 ]]; then
        echo Sync successful 
        gen=$(nixos-rebuild list-generations | grep current)
        git commit -m "$gen"
    else
        echo Rebuild failed. Aborting...    
    fi
else
    echo Home manager failed. Aborting...
fi

popd || exit
