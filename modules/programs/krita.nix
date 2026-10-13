{
  flake.homeModules.krita = { pkgs, ... }: {
    home.packages = [ pkgs.krita ];
  };
}
