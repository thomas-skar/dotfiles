{ self, ... }:
{
  flake.nixosModules.gtk = {
    home-manager.sharedModules = [ self.homeModules.gtk ];
  };

  flake.homeModules.gtk = { pkgs, ... }: {
    home.packages = [
      pkgs.gnome-themes-extra
      pkgs.whitesur-icon-theme
    ];

    gtk = {
      enable = true;

      colorScheme = "dark";
      gtk3.colorScheme = "dark";
      gtk4.colorScheme = "dark";

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
