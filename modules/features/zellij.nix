{ self, ... }:
{
  flake.nixosModules.zellij = {
    home-manager.sharedModules = [ self.homeModules.zellij ];
  };

  flake.homeModules.zellij = {
    programs.zellij = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = true;
      enableZshIntegration = false;
      settings = {
        theme = "ansi"; # molokai-dark
        mouse_mode = true;
      };
      extraConfig = "";
    };
  };
}
