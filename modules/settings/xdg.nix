{ self, ... }:
{
  flake.nixosModules.xdg = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.gnome-themes-extra
    ];

    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
      "/usr/share/applications"
      "/usr/share/xdg-desktop-portal"
      "/etc/profiles/per-user/thomas/share/applications"
    ];

    home-manager.sharedModules = [ self.homeModules.xdg ];
  };

  flake.homeModules.xdg =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.gnome-themes-extra
      ];

      xdg = {
        enable = true;
        mime.enable = true;
        mimeApps.enable = true;
        userDirs = {
          enable = true;
          createDirectories = false;
        };
        autostart = {
          enable = true;
          entries = [ ];
        };
        terminal-exec.enable = true;
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-wlr
            pkgs.xdg-desktop-portal-gtk
            pkgs.xdg-desktop-portal-gnome
          ];
          config = {
            common = {
              default = [
                "gnome"
                "gtk"
                "wlr"
              ];
              "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
            };
            labwc = {
              "org.freedesktop.impl.portal.Inhibit" = "none";
            };
          };
          xdgOpenUsePortal = true;
        };

        localBinInPath = true;
      };

    };
}
