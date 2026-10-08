{
  flake.homeModules.vi-mongo = { pkgs, ... }: {
    home.packages = [
      pkgs.vi-mongo
      pkgs.wl-clipboard
    ];

    programs.fish.shellAbbrs = {
      mongodb = "vi-mongo";
    };
  };
}
