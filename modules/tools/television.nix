{
  flake.homeModules.television = { pkgs, config, ... }: {
    programs.television = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      extraPackages = [
        pkgs.fd
        pkgs.bat
        pkgs.ripgrep
        pkgs.eza
      ];
      channels = { };
      themes = { };
      settings = { };
    };
  };
}
