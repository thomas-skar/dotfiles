{
  flake.homeModules.flow-control = { pkgs, ... }: {
    home.packages = [ pkgs.flow-control ];
  };
}
