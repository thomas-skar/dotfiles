{
  flake.homeModules.neovide =
    { config, lib, ... }:
    let
      enable = config.programs.neovim.enable;
    in
    {
      programs.neovide = {
        enable = enable;
        settings = {
          fork = true;
          frame = "full"; # none
          maximized = false;
          idle = true;
          mouse-cursor-icon = "i-beam"; # arrow
          tabs = true;
          startup-message-capture = true;
          wayland-app-id = "neovide";
          font = {
            normal = [ "Iosevka Custom" ];
            size = 12.0;
            hinting = "full";
            edging = "antialias";
          };
        };
      };

      programs.fish.shellAbbrs = lib.optionalAttrs enable {
        neo = "neovide";
      };

      xdg.desktopEntries = lib.optionalAttrs enable {
        neovide = {
          name = "Neovide";
          icon = "neovim";
          type = "Application";
          exec = "neovide %F";
          categories = [
            "Utility"
            "TextEditor"
          ];
          mimeType = [
            "text/english"
            "text/plain"
            "text/x-makefile"
            "text/x-c++hdr"
            "text/x-c++src"
            "text/x-chdr"
            "text/x-csrc"
            "text/x-java"
            "text/x-moc"
            "text/x-pascal"
            "text/x-tcl"
            "text/x-tex"
            "application/x-shellscript"
            "text/x-c"
            "text/x-c++"
          ];
          startupNotify = true;
          settings = {
            StartupWMClass = "neovide";
          };
        };
      };
    };

}
