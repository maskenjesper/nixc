#!/usr/bin/env bash

# nix requires all files in the directory to be either commited or staged
git add --all

sudo nixos-rebuild switch --flake .#desktop-nixos
home-manager switch --flake . -b backup
