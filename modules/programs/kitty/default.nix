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
    };

    xdg.configFile."kitty/kitty.conf" = {
      source = ./kitty.conf;
      force = true;
    };
    xdg.configFile."kitty/quick-access-terminal.conf" = {
      source = ./quick-access-terminal.conf;
      force = true;
    };
  };
}
