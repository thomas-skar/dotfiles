{
  flake.homeModules.zoxide = { config, ... }: {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = config.programs.fish.enable;
    };

    programs.fish.shellAbbrs = {
      cd = "z";
    };
  };
}
