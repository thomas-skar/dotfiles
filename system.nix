{ pkgs, ... }:
{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;

    nix.enable = true;
    nix.settings.experimental-features = "nix-command flakes";

    environment.systemPackages = with pkgs; [
      curl
    ];

    services.userborn.enable = true;

    users.users.thomas = {
      isNormalUser = true;
      uid = 1000;
      group = "thomas";
      home = "/home/thomas";
    };
    users.groups.thomas.gid = 1000;

    # "services.displayManager" isn't available w/ system-manager
    systemd.tmpfiles.rules = [
      "L+ /usr/share/wayland-sessions/labwc.desktop - - - - ${pkgs.labwc}/share/wayland-sessions/labwc.desktop"
      "L+ /etc/systemd/user/labwc-session.service - - - - ${pkgs.labwc}/share/systemd/user/labwc-session.service"
    ];
  };
}
