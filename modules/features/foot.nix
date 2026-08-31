{
  flake.homeModules.foot = {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        main.font = "JetBrains Mono:size=12";
        main.dpi-aware = "no";
        main.initial-color-theme = "dark";
        main.initial-window-size-pixels = "1280x720";
        main.bold-text-in-bright = "no";

        # monokai pro
        colors-dark = {
          background = "2D2A2E";
          foreground = "FCFCFA";
          regular0 = "403E41"; # black
          regular1 = "FF6188"; # red
          regular2 = "A9DC76"; # green
          regular3 = "FFD866"; # yellow
          regular4 = "FC9867"; # blue
          regular5 = "AB9DF2"; # magenta
          regular6 = "78DCE8"; # cyan
          regular7 = "FCFCFA"; # white
          bright0 = "727072"; # bright black
          bright1 = "FF6188"; # bright red
          bright2 = "A9DC76"; # bright green
          bright3 = "FFD866"; # bright yellow
          bright4 = "FC9867"; # bright blue
          bright5 = "AB9DF2"; # bright magenta
          bright6 = "78DCE8"; # bright cyan
          bright7 = "FCFCFA"; # bright white
          dim0 = "403E41"; # dim black
          dim1 = "FF6188"; # dim red
          dim2 = "A9DC76"; # dim green
          dim3 = "FFD866"; # dim yellow
          dim4 = "FC9867"; # dim blue
          dim5 = "AB9DF2"; # dim magenta
          dim6 = "78DCE8"; # dim cyan
          dim7 = "FCFCFA"; # dim white
        };
      };
    };
  };
}
