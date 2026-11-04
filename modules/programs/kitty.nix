{
  flake.homeModules.kitty = { config, ... }: {
    programs.kitty = {
      enable = true;
      enableGitIntegration = config.programs.git.enable;
      shellIntegration = {
        enableZshIntegration = config.programs.zsh.enable;
        enableBashIntegration = config.programs.bash.enable;
        enableFishIntegration = config.programs.fish.enable;
      };
      settings = { };
    };
  };
}
