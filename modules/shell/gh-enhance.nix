{
  flake.homeModules.gh-enhance = { pkgs, ... }: {
    home.packages = [ pkgs.gh-enhance ];
    home.sessionVariables = {
      ENHANCE_THEME = "";
    };

    programs.fish.shellAbbrs = { };
  };
}
