{ self, ... }:
{
  flake.nixosModules.xdg = {
    environment.pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];

    home-manager.sharedModules = [ self.homeModules.xdg ];
  };

  flake.homeModules.xdg =
    { pkgs, ... }:
    {
      xdg = {
        enable = true;
        portal = {
          enable = true;
          extraPortals = [
            pkgs.xdg-desktop-portal-wlr
            # pkgs.xdg-desktop-portal-gtk
            # pkgs.xdg-desktop-portal-gnome
          ];
          config = {
            common = {
              default = [
                "gnome"
                "gtk"
              ];
              "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
            };
            labwc = {
              "org.freedesktop.impl.portal.Inhibit" = "none";
            };
          };
        };
        localBinInPath = true;
        mimeApps = {
          enable = true;
          defaultApplications = {
            "text/html" = "microsoft-edge.desktop";
            "x-scheme-handler/http" = "microsoft-edge.desktop";
            "x-scheme-handler/https" = "microsoft-edge.desktop";
            "x-scheme-handler/about" = "microsoft-edge.desktop";
            "x-scheme-handler/unknown" = "microsoft-edge.desktop";
            "x-scheme-handler/mailto" = "microsoft-edge.desktop";
            "x-scheme-handler/slack" = "slack.desktop";
          };
        };
        # TODO: move to system ?
        desktopEntries = {
          "microsoft-edge" = {
            name = "Microsoft Edge";
            genericName = "Web Browser";
            type = "Application";
            icon = "microsoft-edge";
            exec = "/usr/bin/microsoft-edge-stable %U";
            categories = [
              "Network"
              "WebBrowser"
            ];
            mimeType = [
              "application/pdf"
              "application/rdf+xml"
              "application/rss+xml"
              "application/xhtml+xml"
              "application/xhtml_xml"
              "application/xml"
              "image/gif"
              "image/jpeg"
              "image/png"
              "image/webp"
              "text/html"
              "text/xml"
              "x-scheme-handler/http"
              "x-scheme-handler/https"
              "x-scheme-handler/microsoft-edge"
            ];
            startupNotify = true;
            terminal = false;
          };
        };
      };

    };
}
