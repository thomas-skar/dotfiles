
[private]
default:
    @just --list

# run system-manager switch
switch:
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --flake .

alias s := switch

# run system-manager switch with --refresh
refresh:
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --refresh --flake .

alias r := refresh

# run system-manager build
build:
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- build --flake .

alias b := build
