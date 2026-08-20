[Install nix](https://github.com/NixOS/nix-installer):

```shell
mkdir -p $HOME/tmp
TMPDIR="$HOME/tmp" curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
```

Run `system-manager switch`:

```shell
nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --flake .
```

---

List wayland windows:

```shell
wlrctl toplevel list
```

Activate VPN:

```shell
nmcli --ask connection up "Intility VPN"
```

Find broken files and directories in /nix/store:

```shell
find /nix/store -maxdepth 1 -type f -perm 440
find /nix/store -maxdepth 1 -type d -perm 540
```

---

Resources:

- [displaylink](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu)
