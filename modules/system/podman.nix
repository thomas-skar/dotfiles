{ pkgs, username, ... }:
{
  environment.systemPackages = [
    pkgs.su
  ];

  # TODO: add systemd service to fix newuidmap/ newgidmap permissions?
  # TODO: I did something manually and now it kinda words...

  home-manager.users."${username}" = {
    home.packages = [
      pkgs.shadow
    ];

    services.podman = {
      enable = true;
    };
  };
}
