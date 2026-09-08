{ self, ... }:
{
  flake.nixosModules.fastfetch = {
    home-manager.sharedModules = [ self.homeModules.fastfetch ];
  };

  flake.homeModules.fastfetch = {
    programs.fastfetch.enable = true;

    programs.fish.shellAbbrs = {
      ff = "fastfetch";
    };
  };
}
