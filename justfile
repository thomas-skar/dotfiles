
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

# find files and directories in /nix/store with broken permissions
find:
    sudo find /nix/store -maxdepth 1 -type f -perm 440 # should be 444
    sudo find /nix/store -maxdepth 1 -type d -perm 440 # should be 555
    sudo find /nix/store -maxdepth 1 -type d -perm 540 # should be 555

# start vpn
vpn:
    nmcli --ask connection up "Intility VPN"

# list wlroots(?) windows
windows:
    wlrctl toplevel list

# nix garbage collection
clean:
    nix-collect-garbage -d
