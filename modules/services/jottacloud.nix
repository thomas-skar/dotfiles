{
  /**
    Jottacloud daemon & CLI.
  */
  flake.nixosModules.jottacloud = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.jotta-cli ];

    # TODO: jottad systemd service?

    home-manager.sharedModules = [
      {
        programs.fish.shellAbbrs = {
          jotta = "jotta-cli";
          jst = "jotta-cli sync trigger";
        };
      }
    ];
  };
}
