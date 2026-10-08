{
  flake.homeModules.ripgrep = {
    programs.ripgrep.enable = true;
    programs.ripgrep-all.enable = true;

    programs.fish.shellAbbrs = {
      cat = "bat --paging=never";
    };
  };
}
