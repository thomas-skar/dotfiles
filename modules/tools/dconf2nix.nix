{
  flake.homeModules.dconf2nix = { pkgs, ... }: {
    home.packages = [ pkgs.dconf2nix ];
  };
}
