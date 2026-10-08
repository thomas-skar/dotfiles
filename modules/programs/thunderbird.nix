{ self, ... }:
{
  flake.nixosModules.thunderbird = {
    home-manager.sharedModules = [ self.homeModules.thunderbird ];
  };

  flake.homeModules.thunderbird = {
    programs.thunderbird = {
      enable = true;
      settings = { };
    };
  };
}
