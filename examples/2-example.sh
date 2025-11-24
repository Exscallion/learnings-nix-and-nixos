#!/usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p curl jq
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/tarball/f8aaff9e0bbccb629aef4e54f41bdfdc98e05a48

curl --silent -H "Accept: application/json" https://icanhazdadjoke.com | jq ".joke"
