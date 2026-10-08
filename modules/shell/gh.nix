{
  flake.homeModules.gh = { pkgs, ... }: {
    home.packages = [ pkgs.gh ];

    programs.fish.shellAbbrs = {
      github = "gh";
    };
  };
}
