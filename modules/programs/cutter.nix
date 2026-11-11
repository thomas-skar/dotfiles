{
  flake.homeModules.cutter = { pkgs, ... }: {
    home.packages = [ pkgs.cutter ];
  };
}
