{
  flake.homeModules.usbtree = { pkgs, ... }: {
    home.packages = [
      pkgs.usbtree
    ];
  };
}
