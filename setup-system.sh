#!/bin/sh
set -e
sudo nixos-rebuild switch -I nixos-config=./configuration.nix
