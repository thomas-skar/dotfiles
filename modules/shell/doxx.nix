{
  flake.homeModules.doxx = { pkgs, ... }: {
    home.packages = [ pkgs.doxx ];

    programs.fish.shellAbbrs = {
      word = "doxx";
      docx = "doxx";
    };
  };
}
