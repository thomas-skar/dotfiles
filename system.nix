{ pkgs, ... }:
{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;

    nix.enable = true;
    nix.settings.experimental-features = "nix-command flakes";

    services.userborn.enable = true;

    environment.systemPackages = with pkgs; [
      curl
    ];

    users.users.thomas = {
      isNormalUser = true;
      uid = 1000;
      group = "thomas";
      home = "/home/thomas";
    };
    users.groups.thomas.gid = 1000;
  };
}
