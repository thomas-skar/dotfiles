Ubuntu w/ nix system-manager & home-manager.

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

Reload kanshi (monitor placement tool):

```shell
kanshictl reload
```

???

```shell
git add --intent-to-add extra/flake.nix
git update-index --skip-worktree --assume-unchanged extra/flake.nix
```

---

Resources:

- [displaylink](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu)
