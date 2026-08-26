{
  flake.homeModules.xdg = {

    # TODO: move edge to system ?
    xdg = {
      enable = true;

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
