{
  flake.homeModules.ilspy = { pkgs, ... }: {
    home.packages = [ pkgs.ilspycmd ];
  };
}
