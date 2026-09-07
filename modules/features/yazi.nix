{ self, ... }:
{
  flake.nixosModules.yazi = {
    home-manager.sharedModules = [ self.homeModules.yazi ];
  };

  flake.homeModules.yazi = {
    programs.yazi.enable = true;

    xdg.desktopEntries.yazi = {
      name = "Yazi File Manager";
      noDisplay = true;
    };
  };
}
