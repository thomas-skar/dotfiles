{ self, ... }:
{
  flake.nixosModules.zellij = {
    home-manager.sharedModules = [ self.homeModules.zellij ];
  };

  flake.homeModules.zellij = { pkgs, ... }: {
    programs.zellij = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
      enableZshIntegration = false;
      plugins = [
        pkgs.zellijPlugins.zjstatus
        pkgs.zellijPlugins.zjframes
      ];
    };

    xdg.configFile."zellij/config.kdl".source = ./config.kdl;
    xdg.configFile."zellij/layouts/custom.kdl".source = ./layout.kdl;
  };
}
