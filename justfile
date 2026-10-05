# symlink recipes
mod symlink "symlink.just"

# (s)ym(l)ink (a)ll
alias sla := symlink::all

[private]
default:
    @just --list

# run system-manager switch
switch:
    git add .
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" --accept-flake-config -- switch --sudo --flake .#systemConfigs.default

alias s := switch

# run system-manager switch with --refresh
refresh:
    git add .
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --refresh --flake .#systemConfigs.default

alias r := refresh

# run system-manager build
build:
    git add .
    nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- build --flake .#systemConfigs.default

alias b := build

# update nix flake input
update input="":
    git add .
    nix flake update {{ input }}

alias u := update

# show nix flake outputs
show:
    nix flake show

# check if nix flake is up-to-date
check:
    nix flake check

# run nix garbage collection
clean:
    sudo /run/system-manager/sw/bin/nix-env --delete-generations old --profile /nix/var/nix/profiles/system-manager-profiles/system-manager
    nix-collect-garbage -d

alias d := clean

# show nix dependency graph
tree:
    nix-tree --derivation .#systemConfigs.default

alias t := tree
