{ self, ... }:
{
  flake.nixosModules.sql = {
    home-manager.sharedModules = [ self.homeModules.sql ];
  };

  flake.homeModules.sql = { pkgs, ... }: {
    home.packages = [
      pkgs.sqlite
      pkgs.sqlit-tui
    ];
  };
}
