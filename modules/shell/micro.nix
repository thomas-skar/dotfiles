{
  flake.homeModules.micro = {
    programs.micro.enable = true;

    xdg.desktopEntries.micro = {
      name = "Micro";
      noDisplay = true;
    };
  };
}
