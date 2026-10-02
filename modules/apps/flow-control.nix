{ self, ... }:
{
  flake.nixosModules.flow-control = {
    home-manager.sharedModules = [ self.homeModules.flow-control ];
  };

  flake.homeModules.flow-control = { pkgs, ... }: {
    home.packages = [
      pkgs.flow-control
    ];
  };
}
