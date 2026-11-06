{
  flake.homeModules.yazi = { config, ... }: {
    programs.yazi = {
      enable = true;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      enableZshIntegration = config.programs.zsh.enable;

      initLua = ./init.lua;
      shellWrapperName = "yazi";

      extraPackages = [ ];
    };

    xdg.configFile."yazi/keymap.toml" = {
      source = ./keymap.toml;
      force = true;
    };
    xdg.configFile."yazi/theme.toml" = {
      source = ./theme.toml;
      force = true;
    };
    xdg.configFile."yazi/yazi.toml" = {
      source = ./yazi.toml;
      force = true;
    };

    xdg.desktopEntries.yazi = {
      name = "Yazi File Manager";
      noDisplay = true;
    };

    programs.fish.shellAbbrs = {
      y = "yazi";
    };
  };
}
