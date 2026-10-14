{
  flake.homeModules.qalculate = { pkgs, ... }: {
    home.packages = [ pkgs.qalculate-gtk ];
  };
}
