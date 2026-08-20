https://github.com/NixOS/nix-installer:

```shell
mkdir -p $HOME/tmp
TMPDIR="$HOME/tmp" curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
```

```shell
nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --flake .
```

```shell
wlrctl toplevel list
```

```shell
nmcli --ask connection up "Intility VPN"
```

```shell
find /nix/store -maxdepth 1 -type f -perm 440
find /nix/store -maxdepth 1 -type d -perm 540
```

---

- [displaylink](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu)
