{
  flake.homeModules.door-knocker = { pkgs, ... }: {
    home.packages = [ pkgs.door-knocker ];
  };
}
