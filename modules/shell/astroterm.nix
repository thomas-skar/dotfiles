{
  flake.homeModules.astroterm = { pkgs, ... }: {
    home.packages = with pkgs; [
      astroterm
    ];
  };
}
