{
  flake.homeModules.sqlit = {
    # pkgs.sqlit-tui
    programs.uv.tool.packages = [ "sqlit-tui" ];

    programs.fish.shellAbbrs = {
      sql = "sqlit";
    };
  };
}
