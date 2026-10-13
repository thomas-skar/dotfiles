{
  flake.homeModules.mypaint = { pkgs, ... }: {
    home.packages = [ pkgs.mypaint ];
  };
}
