{
  # dive = explore docker image layers
  flake.homeModules.dive = { pkgs, ... }: {
    home.packages = [ pkgs.dive ];
  };
}
