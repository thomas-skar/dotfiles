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
          regular0 = "403E41";
          regular1 = "FF6188";
          regular2 = "A9DC76";
          regular3 = "FFD866";
          regular4 = "FC9867";
          regular5 = "AB9DF2";
          regular6 = "78DCE8";
          regular7 = "FCFCFA";
          bright0 = "727072";
          bright1 = "FF6188";
          bright2 = "A9DC76";
          bright3 = "FFD866";
          bright4 = "FC9867";
          bright5 = "AB9DF2";
          bright6 = "78DCE8";
          bright7 = "FCFCFA";
          dim0 = "403E41";
          dim1 = "FF6188";
          dim2 = "A9DC76";
          dim3 = "FFD866";
          dim4 = "FC9867";
          dim5 = "AB9DF2";
          dim6 = "78DCE8";
          dim7 = "FCFCFA";
        };
      };
    };
  };
}
