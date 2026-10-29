{
  flake.homeModules.zmx = { pkgs, ... }: {
    home.packages = [ pkgs.zmx ];
  };
}
