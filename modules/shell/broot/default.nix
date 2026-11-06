{
  flake.homeModules.broot = { config, pkgs, ... }: {
    programs.broot = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      package = pkgs.broot;
    };

    xdg.configFile."broot/conf.hjson" = {
      source = ./conf.hjson;
      force = true;
    };
    xdg.configFile."broot/verbs.hjson" = {
      source = ./verbs.hjson;
      force = true;
    };
  };
}
