{
  flake.homeModules.gh-dash = {
    programs.gh-dash = {
      enable = true;
      settings = { };
    };

    programs.fish.shellAbbrs = {
      gd = "gh-dash";
      ghd = "gh-dash";
    };
  };
}
