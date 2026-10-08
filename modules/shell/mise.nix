{ self, ... }:
{
  flake.nixosModules.mise = {
    home-manager.sharedModules = [ self.homeModules.mise ];
  };

  flake.homeModules.mise = { pkgs, config, ... }: {
    home.packages = [ pkgs.usage ];

    programs.mise = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
    };

    programs.fish.shellAbbrs = {
      m = "mise";
      mr = "mise run";
    };
  };
}
