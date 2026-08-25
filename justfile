
[private]
default:
    @just --list

# run system-manager switch
switch:
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" --accept-flake-config -- switch --sudo --flake .#systemConfigs.default

alias s := switch

# run system-manager switch with --refresh
refresh:
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --refresh --flake .#systemConfigs.default

alias r := refresh

# run system-manager build
build:
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- build --flake .#systemConfigs.default

alias b := build

# nix garbage collection
clean:
    nix-collect-garbage -d

# show dependency graph
tree:
    nix-tree --derivation .#systemConfigs.default
