{
  flake.homeModules.navi = { config, ... }: {
    programs.navi = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      settings = { };
    };
  };
}
