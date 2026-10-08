{
  flake.homeModules.direnv = { config, ... }: {
    programs.direnv = {
      enable = true;

      enableGitIntegration = config.programs.git.enable;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;

      nix-direnv.enable = true;

      mise.enable = config.programs.mise.enable;
    };
  };
}
