{ self, ... }:
{
  flake.nixosModules.delta = {
    home-manager.sharedModules = [ self.homeModules.delta ];
  };

  flake.homeModules.delta = {
    programs.delta = {
      enable = true;
      enableGitIntegration = true; # TODO if enabled
      enableJujutsuIntegration = true; # TODO if enabled
      options = { };
    };
  };
}
