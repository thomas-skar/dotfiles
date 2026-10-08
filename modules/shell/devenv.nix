{
  flake.homeModules.devenv = { config, ... }: {
    programs.devenv = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      enableZshIntegration = config.programs.zsh.enablen;

      settings = {
        shell = {
          prompt_prefix = true;
        };
        tui = {
          statusline = {
            enabled = true;
          };
        };
      };
    };
  };
}
