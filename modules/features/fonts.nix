{ self, withSystem, ... }:
{
  flake-file.inputs.apple-fonts = {
    url = "github:Lyndeno/apple-fonts.nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.fonts = {
    home-manager.sharedModules = [ self.homeModules.fonts ];
  };

  # withSystem is required to get the "sf-pro" package from the apple-fonts overlay
  flake.homeModules.fonts = withSystem "x86_64-linux" (
    { pkgs, ... }: {
      home.packages = [
        pkgs.jetbrains-mono
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.inter
        pkgs.sf-pro # from apple-fonts overlay
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
