{ self, ... }:
{
  flake.nixosModules.gtk = {
    home-manager.sharedModules = [ self.homeModules.gtk ];
  };

  flake.homeModules.gtk = {
    gtk = {
      enable = true;
      iconTheme.name = "MacTahoe";
      cursorTheme.name = "Adwaita";
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
