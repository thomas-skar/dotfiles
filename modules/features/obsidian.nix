{ self, ... }:
{
  flake.nixosModules.obsidian = {
    home-manager.sharedModules = [ self.homeModules.obsidian ];
  };

  flake.homeModules.obsidian = {
    programs.obsidian.enable = true;
  };
}
