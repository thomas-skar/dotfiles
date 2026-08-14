{ pkgs, ... }:
let
  imports = [
    ./keyd.nix
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

  # "services.displayManager" isn't available w/ system-manager
  systemd.tmpfiles.rules = [
    "L+ /usr/share/wayland-sessions/labwc.desktop - - - - ${pkgs.labwc}/share/wayland-sessions/labwc.desktop"
    "L+ /etc/systemd/user/labwc-session.service - - - - ${pkgs.labwc}/share/systemd/user/labwc-session.service"
  ];
}
