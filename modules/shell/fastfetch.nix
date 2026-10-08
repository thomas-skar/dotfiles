{
  flake.homeModules.fastfetch = {
    programs.fastfetch.enable = true;

    programs.fish.shellAbbrs = {
      ff = "fastfetch";
    };
  };
}
