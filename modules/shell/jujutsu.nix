{ self, ... }:
{
  flake.nixosModules.jujutsu = {
    home-manager.sharedModules = [ self.homeModules.jujutsu ];
  };

  flake.homeModules.jujutsu = { pkgs, ... }: {
    home.packages = [
      pkgs.lazyjj
    ];

    programs.jujutsu = {
      enable = true;
      settings = { };
    };

    programs.jjui = {
      enable = true;
      settings = { };
    };
  };
}
