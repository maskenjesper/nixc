#!/usr/bin/env bash

# nix requires all files in the directory to be either commited or staged
git add --all

home-manager switch --flake . -b backup

if [[ $? -eq 0 ]]; then
    sudo nixos-rebuild switch --flake .#desktop-nixos
    
    if [[ $? -eq 0 ]]; then
        echo Sync successful 
    else
        echo Home manager failed. Aborting...
    fi
else
    echo Rebuild failed. Aborting...    
fi
