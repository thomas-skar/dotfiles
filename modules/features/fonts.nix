{
  flake.homeModules.fonts = { pkgs, ... }: {
    home.packages = [
      pkgs.jetbrains-mono
      pkgs.nerd-fonts.jetbrains-mono
    ];

    fonts.fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "JetBrains Mono" ];
    };
  };
}
