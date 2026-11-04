{
  flake.homeModules.cartero = { pkgs, ... }: {
    home.packages = [ pkgs.cartero ];
  };
}
