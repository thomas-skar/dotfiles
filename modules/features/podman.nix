{ self, ... }:
{
  flake.nixosModules.podman = {
    home-manager.sharedModules = [ self.homeModules.podman ];
  };

  flake.homeModules.podman = { pkgs, ... }: {
    home.packages = [
      pkgs.shadow
    ];

    services.podman = {
      enable = true;
    };

  };
}
