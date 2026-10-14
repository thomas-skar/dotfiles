{
  flake.homeModules.protonmail = { pkgs, ... }: {
    home.packages = [ pkgs.protonmail-desktop ];
  };
}
