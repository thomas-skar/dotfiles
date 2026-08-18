https://github.com/NixOS/nix-installer

"""shell
mkdir -p $HOME/tmp
TMPDIR="$HOME/tmp" curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
"""

"""shell
nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" -- switch --sudo --flake .
"""

home-manager-pakker legger seg i /etc/profiles/per-user/<brukernavn>/bin: sørg for at permissions er riktig.

blir lagt til i path av /etc/profile.d/system-manager-path.sh

## Merknader

- displaylink driver'n må installeres på den "vanlige måten" (via apt)
