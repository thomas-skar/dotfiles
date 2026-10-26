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

Resources:

- [displaylink](https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu)
