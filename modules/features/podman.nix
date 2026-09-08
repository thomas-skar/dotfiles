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

    programs.fish.shellAbbrs = {
      pps = "podman ps -a";
      ppsw = "podman ps -a -w 1";
      pprmaf = "podman pod rm --all --force";
    };
  };
}
