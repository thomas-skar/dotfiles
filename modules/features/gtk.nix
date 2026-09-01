{ self, ... }:
{
  flake.modules.generic.gtk = {
    home-manager.sharedModules = [
      self.modules.homeManager.macTahoeIconTheme
      self.modules.homeManager.dconf
      self.modules.homeManager.gtk
    ];
  };

  flake.modules.homeManager.macTahoeIconTheme = {
    gtk.iconTheme.name = "MacTahoe";
  };

  flake.modules.homeManager.dconf = {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  flake.modules.homeManager.gtk = {
    gtk = {
      enable = true;
      colorScheme = "dark";
      cursorTheme.name = "Adwaita";
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
  };
}
