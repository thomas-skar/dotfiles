{
  flake.homeModules.fzf = {
    programs.fzf = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
    };
  };
}
