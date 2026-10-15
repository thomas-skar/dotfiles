{ withSystem, ... }:
{
  # withSystem is required to get the "sf-pro" package from the apple-fonts overlay
  flake.homeModules.fonts = withSystem "x86_64-linux" (
    { pkgs, ... }:
    let
      # TODO: nerd font?
      iosevka-custom = pkgs.iosevka.override {
        set = "Custom";
        privateBuildPlan = ''
          [buildPlans.IosevkaCustom]
          family = "Iosevka Custom"
          spacing = "normal"
          serifs = "sans"
          noCvSs = true
          exportGlyphNames = false

            [buildPlans.IosevkaCustom.variants]
            inherits = "ss14"

          [buildPlans.IosevkaCustom.weights.Light]
          shape = 300
          menu = 300
          css = 300

          [buildPlans.IosevkaCustom.weights.Regular]
          shape = 400
          menu = 400
          css = 400

          [buildPlans.IosevkaCustom.weights.Medium]
          shape = 500
          menu = 500
          css = 500

          [buildPlans.IosevkaCustom.weights.Bold]
          shape = 700
          menu = 700
          css = 700

          [buildPlans.IosevkaCustom.widths.Normal]
          shape = 600
          menu = 5
          css = "normal"

          [buildPlans.IosevkaCustom.widths.SemiExtended]
          shape = 658
          menu = 6
          css = "semi-expanded"

          [buildPlans.IosevkaCustom.widths.Extended]
          shape = 720
          menu = 7
          css = "expanded"

          [buildPlans.IosevkaCustom.slopes.Upright]
          angle = 0
          shape = "upright"
          menu = "upright"
          css = "normal"

          [buildPlans.IosevkaCustom.slopes.Italic]
          angle = 9.4
          shape = "italic"
          menu = "italic"
          css = "italic"
        '';
      };
    in
    {
      home.packages = [
        pkgs.jetbrains-mono
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.inter
        pkgs.sf-pro # from apple-fonts overlay

        # pkgs.iosevka
        # pkgs.nerd-fonts.iosevka
        # pkgs.nerd-fonts.iosevka-term
        # pkgs.nerd-fonts.iosevka-term-slab
        # pkgs.aporetic
        iosevka-custom
      ];

      fonts.fontconfig = {
        enable = true;
        hinting = "slight";
        antialiasing = true;
        defaultFonts = {
          # sansSerif = [ "Noto Sans" ];
          # monospace = [ "JetBrains Mono" ];
        };
      };
    }
  );
}
