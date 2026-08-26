{
  flake.homeModules.foot = {
    programs.foot = {
      enable = true;
      server.enable = false;
      settings = {
        main.font = "JetBrains Mono:size=14";
        main.dpi-aware = "yes";
        main.initial-color-theme = "dark";
        main.bold-text-in-bright = "yes";
      };
    };
  };
}
