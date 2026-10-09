{
  # act = test github actions locally
  flake.homeModules.act = { pkgs, ... }: {
    home.packages = [ pkgs.act ];
  };
}
