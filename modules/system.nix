{ pkgs, ... }:
let
  imports = [
    ./keyd.system.nix
    ./apparmor.system.nix
  ];

  packages = [
    pkgs.curl
  ];
in
{
  imports = imports;

  nixpkgs.hostPlatform = "x86_64-linux";
  nixpkgs.config.allowUnfree = true;

  # /etc/nix/nix.conf settings
  nix.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
    trusted-users = [ "thomas" ];
    auto-optimise-store = true;
    trusted-substituters = [
      "https://cache.nixos.org/"
      "https://cache.numtide.com"
      "https://noctalia.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
    sync-before-registering = true;
  };

  environment.systemPackages = packages;

  # environment.etc."shells" = {
  #   enable = true;
  #   user = "root";
  #   group = "root";
  #   mode = "0644";
  #   replaceExisting = true;
  #   text = ''
  #     /bin/sh
  #     /usr/bin/sh
  #     /bin/bash
  #     /usr/bin/bash
  #     ${pkgs.fish}/bin/fish
  #   '';
  # };

  # TODO: fix
  environment.etc."pam.d/noctalia" = {
    enable = true;
    user = "root";
    group = "root";
    text = ''
      auth required pam_unix.so
    '';
  };

  services.userborn.enable = true;

  users.users.thomas = {
    enable = true;
    isNormalUser = true;
    createHome = true;
    uid = 1000;
    group = "thomas";
    extraGroups = [ ];
    home = "/home/thomas";
    homeMode = "700";
  };
  users.groups.thomas.gid = 1000;

  # TODO: https://system-manager.net/main/reference/all-options/#systemautoupgradeenable
  system.autoUpgrade.enable = false;

  systemd.services."nix-store-permissions" = {
    enable = true;
    description = "fix /nix/store permissions";
    wantedBy = [ "system-manager.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = builtins.readFile ./scripts/nix-store-permissions.sh;
  };

  systemd.services."icon-permissions" = {
    enable = true;
    description = "fix icon directory permissions";
    wantedBy = [ "system-manager.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = builtins.readFile ./scripts/icon-permissions.sh;
    scriptArgs = "thomas";
  };
}
