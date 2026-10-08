{
  flake.homeModules.github-cli = { pkgs, ... }: {
    home.packages = [ pkgs.gh ];

    programs.fish.shellAbbrs = {
      github = "gh";
    };
  };
}
