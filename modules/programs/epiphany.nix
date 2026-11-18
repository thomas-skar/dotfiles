{
  flake.homeModules.epiphany = { pkgs, ... }: {
    home.packages = [ pkgs.epiphany ];
  };
}
