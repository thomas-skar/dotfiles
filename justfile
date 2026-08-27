
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

# regen nix flake w/ flake-file
write:
    nix run .#write-flake

alias w := write

# show nix flake outputs
show:
    nix flake show

# check if nix flake is up-to-date
check:
    nix flake check

# run nix garbage collection
clean:
    nix-collect-garbage -d

# show nix dependency graph
tree:
    nix-tree --derivation .#systemConfigs.default

alias t := tree
