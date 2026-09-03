{ self, ... }:
{
  flake.nixosModules.gtk = {
    home-manager.sharedModules = [ self.homeModules.gtk ];
  };

  flake.homeModules.gtk = {
    gtk = {
      enable = true;
      colorScheme = "dark";
      iconTheme.name = "MacTahoe";
      cursorTheme.name = "Adwaita";
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
