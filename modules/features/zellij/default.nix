{ self, ... }:
{
  flake.nixosModules.zellij = {
    home-manager.sharedModules = [ self.homeModules.zellij ];
  };

  flake.homeModules.zellij = { pkgs, ... }: {
    programs.zellij = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
      enableZshIntegration = false;
      plugins = [
        pkgs.zellijPlugins.zjstatus
        pkgs.zellijPlugins.zjframes
      ];
      layouts = {
        custom = ./layout.kdl;
      };
    };

    xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  };
}
