{
  flake.homeModules.gtk = {
    gtk = {
      enable = true;
      iconTheme.name = "MacTahoe";
      cursorTheme.name = "Adwaita";
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
  };
}
