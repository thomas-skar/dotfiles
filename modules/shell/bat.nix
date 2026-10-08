{
  flake.homeModules.bat = {
    programs.bat.enable = true;

    programs.fish.shellAbbrs = {
      cat = "bat --paging=never";
    };
  };
}
