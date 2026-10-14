{
  flake.homeModules.xleak = { pkgs, ... }: {
    home.packages = [ pkgs.xleak ];

    programs.fish.shellAbbrs = {
      excel = "xleak";
      xlsx = "xleak";
    };
  };
}
