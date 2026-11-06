{
  flake.homeModules.nnn = { pkgs, config, ... }: {
    programs.nnn = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;

      package = pkgs.nnn.override { withNerdIcons = true; };
      extraPackages = [ ];

      options = { };
      plugins = { };
      bookmarks = { };
      quitcd = false;
    };
  };
}
