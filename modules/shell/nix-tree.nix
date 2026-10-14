{
  flake.homeModules.nix-tree = { pkgs, ... }: {
    home.packages = [ pkgs.nix-tree ];
  };
}
