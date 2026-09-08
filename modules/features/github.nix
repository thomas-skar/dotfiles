{ self, ... }:
{
  flake.nixosModules.github = {
    home-manager.sharedModules = [ self.homeModules.github ];
  };

  flake.homeModules.github = { pkgs, ... }: {
    home.packages = [
      pkgs.gh
    ];

    programs.fish.shellAbbrs = {
      github = "gh";
    };
  };
}
