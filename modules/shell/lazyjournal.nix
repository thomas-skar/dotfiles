{
  flake.homeModules.lazyjournal = { pkgs, ... }: {
    home.packages = [ pkgs.lazyjournal ];
  };
}
