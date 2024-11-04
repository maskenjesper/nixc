#!/usr/bin/env bash
sudo nixos-rebuild switch --flake .#desktop-nixos
home-manager switch --flake . -b backup
