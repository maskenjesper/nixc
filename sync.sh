#!/usr/bin/env bash

sudo echo starting

# nix requires all files in the directory to be either commited or staged
sudo git add --all

home-manager switch --flake . -b backup

if [[ $? -eq 0 ]]; then
    sudo nixos-rebuild switch --flake .#desktop
    
    if [[ $? -eq 0 ]]; then
        echo Sync successful 
    else
        echo Home manager failed. Aborting...
    fi
else
    echo Rebuild failed. Aborting...    
fi
