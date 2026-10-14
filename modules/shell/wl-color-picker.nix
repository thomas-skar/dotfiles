{
  flake.homeModules.wl-color-picker = { pkgs, ... }: {
    home.packages = [ pkgs.wl-color-picker ];
  };
}
