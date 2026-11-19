{
  /**
    Why is this running?
  */
  flake.homeModules.witr = { pkgs, ... }: {
    home.packages = [ pkgs.witr ];

    programs.fish.shellAbbrs = {
      why = "witr";
      why-is-this-running = "witr";
    };
  };
}
