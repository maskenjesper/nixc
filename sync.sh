#!/usr/bin/env bash

sudo echo starting

# nix requires all files in the directory to be either commited or staged
git add --all

echo ====================== Running home-manager ======================
home-manager switch --impure --flake . -b backup

if [[ $? -eq 0 ]]; then
    echo ====================== Running nixos-rebuild ======================
    sudo nixos-rebuild switch --flake .#desktop
    
    if [[ $? -eq 0 ]]; then
        echo Sync successful 
    else
        echo Rebuild failed. Aborting...    
    fi
else
    echo Home manager failed. Aborting...
fi
