{
  flake.homeModules.bruno = { pkgs, ... }: {
    home.packages = [ pkgs.bruno ];

    home.sessionVariables = {
      TMPDIR = "$HOME/tmp";
    };
  };
}
