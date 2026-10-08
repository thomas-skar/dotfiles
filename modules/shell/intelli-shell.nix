{
  flake.homeModules.intelli-shell = { config, ... }: {
    programs.intelli-shell = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      settings = {
        check_updates = false;
      };
      shellHotkeys = { };
    };
  };
}
