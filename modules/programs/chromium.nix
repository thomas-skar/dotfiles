{ self, ... }:
{
  flake.nixosModules.chromium = {
    home-manager.sharedModules = [ self.homeModules.chromium ];
  };

  flake.homeModules.chromium = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      package = pkgs.chromium; # TODO: ungoogled-chromium
    };
  };
}
