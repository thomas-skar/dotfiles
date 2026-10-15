{
  flake.homeModules.diffnav = { pkgs, ... }: {
    home.packages = [ pkgs.diffnav ];
  };
}
