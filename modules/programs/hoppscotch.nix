{
  flake.homeModules.hoppscotch = { pkgs, ... }: {
    home.packages = [ pkgs.hoppscotch ];
  };
}
