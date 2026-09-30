{ self, ... }:
{
  flake.nixosModules.gram = {
    home-manager.sharedModules = [ self.homeModules.gram ];
  };

  flake.homeModules.gram = {
    programs.gram = {
      enable = true;
      extraPackages = [ ];
      settings = { };
    };
  };
}
