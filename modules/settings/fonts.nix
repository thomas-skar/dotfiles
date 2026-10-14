{ withSystem, ... }:
{
  # withSystem is required to get the "sf-pro" package from the apple-fonts overlay
  flake.homeModules.fonts = withSystem "x86_64-linux" (
    { pkgs, ... }: {
      home.packages = [
        pkgs.jetbrains-mono
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.inter
        pkgs.sf-pro # from apple-fonts overlay
        pkgs.iosevka
        pkgs.nerd-fonts.iosevka
        pkgs.nerd-fonts.iosevka-term
        pkgs.nerd-fonts.iosevka-term-slab
        pkgs.aporetic
      ];

      fonts.fontconfig = {
        enable = true;
        defaultFonts = {
          sansSerif = [ "Noto Sans" ];
          monospace = [ "JetBrains Mono" ];
        };
      };
    }
  );
}
