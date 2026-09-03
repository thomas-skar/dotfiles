{ self, withSystem, ... }:
{
  flake-file.inputs.nur = {
    url = "github:nix-community/nur";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.flake-parts.follows = "flake-parts";
  };

  flake.nixosModules.librewolf = {
    home-manager.sharedModules = [ self.homeModules.librewolf ];
  };

  # withSystem is required to use the nur overlay
  flake.homeModules.librewolf = withSystem "x86_64-linux" (
    { pkgs, ... }: {
      programs.librewolf = {
        enable = true;
        profiles.default.extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          multi-account-containers
          ublock-origin
        ];
      };
    }
  );
}
