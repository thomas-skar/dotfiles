{ self, ... }:
{
  flake.nixosModules.systemModuleBundle = {
    imports = with self.nixosModules; [
      home-manager
      system-graphics
      keyd
      apparmor
      systemd
      gdm
    ];
  };

  flake.homeModules.userModuleBundle = {
    imports = with self.homeModules; [
      fish
      labwc
      noctalia
      atuin
      bash
      chromium
      displays
      fonts
      foot
      ghostty
      git
      helix
      just
      k8s
      librewolf
      obsidian
      podman
      ssh
      starship
      teams
      xdg
      zed
    ];
  };
}
