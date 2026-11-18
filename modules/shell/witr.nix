{
  /**
    Why is this running?
  */
  flake.homeModules.witr = { pkgs, ... }: {
    home.packages = [ pkgs.witr ];
  };
}
