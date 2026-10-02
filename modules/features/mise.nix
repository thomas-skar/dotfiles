{ self, ... }:
{
  flake.nixosModules.mise = {
    home-manager.sharedModules = [ self.homeModules.mise ];
  };

  flake.homeModules.mise = { pkgs, config, ... }: {
    home.packages = [ pkgs.usage ];

    programs.mise = {
      enable = true;
      enableFishIntegration = config.programs.fish.enable;
    };

    programs.fish.shellAbbrs = {
      m = "mise";
      mr = "mise run";
    };
  };
}
