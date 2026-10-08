{
  flake.homeModules.tokei = { pkgs, ... }: {
    home.packages = [ pkgs.tokei ];
  };
}
