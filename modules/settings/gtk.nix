{
  flake.homeModules.gtk = {
    gtk = {
      enable = true;
      colorScheme = "dark";
      gtk3.colorScheme = "dark";
      gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
      gtk4.colorScheme = "dark";
      iconTheme.name = "MacTahoe";
      cursorTheme.name = "Adwaita";
    };

    # TODO: dconf2nix ?
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        icon-theme = "MacTahoe";
        gtk-theme = "Adwaita";
        cursor-theme = "Adwaita";
      };
    };
  };
}
