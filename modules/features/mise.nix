{ self, ... }:
{
  flake.nixosModules.mise = {
    home-manager.sharedModules = [ self.homeModules.mise ];
  };

  flake.homeModules.mise = {
    programs.mise = {
      enable = true;
      enableFishIntegration = true; # TODO if enabled
    };

    programs.direnv = {
      enable = true;
      mise.enable = true;
    };
  };
}
