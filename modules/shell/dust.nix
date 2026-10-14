{
  flake.homeModules.dust = { pkgs, ... }: {
    home.packages = [ pkgs.dust ];
  };
}
