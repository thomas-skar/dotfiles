{ self, ... }:
{
  flake.nixosModules.delta = {
    home-manager.sharedModules = [ self.homeModules.delta ];
  };

  flake.homeModules.delta = { config, ... }: {
    programs.delta = {
      enable = true;
      enableGitIntegration = config.programs.git.enable;
      enableJujutsuIntegration = config.programs.jujutsu.enable;
      options = { };
    };
  };
}
