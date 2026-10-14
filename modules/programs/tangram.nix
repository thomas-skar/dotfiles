{
  flake.homeModules.tangram = { pkgs, ... }: {
    home.packages = [ pkgs.tangram ];
  };
}
