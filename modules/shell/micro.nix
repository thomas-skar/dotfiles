{ self, ... }:
{
  flake.nixosModules.micro = {
    home-manager.sharedModules = [ self.homeModules.micro ];
  };

  flake.homeModules.micro = {
    programs.micro.enable = true;

    xdg.desktopEntries.micro = {
      name = "Micro";
      noDisplay = true;
    };
  };
}
