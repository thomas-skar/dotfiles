{
  flake.homeModules.sd = { pkgs, ... }: {
    home.packages = [ pkgs.sd ];
  };
}
