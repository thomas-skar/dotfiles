{ self, ... }:
{
  flake.nixosModules.gram = {
    home-manager.sharedModules = [ self.homeModules.gram ];
  };

  flake.homeModules.gram = {
    programs.gram = {
      enable = true;
      extraPackages = [ ];
      settings = { };
    };

    xdg.desktopEntries."app.liten.Gram" = {
      type = "Application";
      name = "Gram";
      exec = "gram %U";
      icon = "zed"; # <--
      categories = [
        "Development"
        "TextEditor"
        "IDE"
      ];
      mimeType = [
        "text/plain"
        "application/x-zerosize"
        "x-scheme-handler/gram"
      ];
      startupNotify = true;
      settings = {
        StartupWMClass = "app.liten.Gram";
      };
    };
  };
}
