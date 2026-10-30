{
  flake.homeModules.linecast = { pkgs, ... }: {
    home.packages = [
      pkgs.linecast
    ];
  };
}
