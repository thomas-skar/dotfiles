{ inputs, ... }:
{
  flake-file.inputs.nur = {
    url = "github:nix-community/nur";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.flake-parts.follows = "flake-parts";
  };

  flake.homeModules.librewolf = {

    programs.librewolf = {
      enable = true;
      profiles.default.extensions.packages =
        with inputs.nur.legacyPackages.x86_64-linux.repos.rycee.firefox-addons; [
          darkreader
          multi-account-containers
          ublock-origin
        ];
    };

  };
}
