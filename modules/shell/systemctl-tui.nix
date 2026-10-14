{
  flake.homeModules.systemctl-tui = { pkgs, ... }: {
    home.packages = [ pkgs.systemctl-tui ];
  };
}
