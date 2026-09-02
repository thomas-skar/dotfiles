{ self, ... }:
{
  flake.modules.generic.jujutsu = {
    home-manager.sharedModules = [ self.modules.homeManager.jujutsu ];
  };

  flake.modules.homeManager.jujutsu = { pkgs, ... }: {
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
