#!/usr/bin/env bash

for pkg in $(nix flake show --json | jq -r ".packages[\"x86_64-linux\"] | keys | .[]"); do
    echo "Building $pkg"
    nix build ".#$pkg"
done

exit 0
