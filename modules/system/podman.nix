{ pkgs, username, ... }:
{
  environment.systemPackages = [
    pkgs.su
  ];

  # TODO: add systemd service to fix newuidmap/ newgidmap permissions?

  home-manager.users."${username}".services.podman = {
    enable = true;
  };
}
