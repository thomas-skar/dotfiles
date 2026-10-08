{
  flake.homeModules.yazi = { config, ... }: {
    programs.yazi = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      enableZshIntegration = config.programs.zsh.enable;
    };

    xdg.desktopEntries.yazi = {
      name = "Yazi File Manager";
      noDisplay = true;
    };
  };
}
