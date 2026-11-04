{
  flake.homeModules.yaak = { pkgs, ... }: {
    home.packages = [ pkgs.yaak ];
  };
}
