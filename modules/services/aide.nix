{
  /**
    Systemd service to lower AIDE CPU usage.
  */
  flake.nixosModules.aide = {
    systemd.services."nice-aide" = {
      enable = false; # TODO
    };
  };
}
