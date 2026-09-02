{ self, ... }:
{
  flake.modules.generic.delta = {
    home-manager.sharedModules = [ self.modules.homeManager.delta ];
  };

  flake.modules.homeManager.delta = {
    programs.delta = {
      enable = true;
      enableGitIntegration = true; # TODO if enabled
      enableJujutsuIntegration = true; # TODO if enabled
      options = { };
    };
  };
}
