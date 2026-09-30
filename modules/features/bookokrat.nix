{ self, withSystem, ... }:
{
  flake-file.inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
      # inputs.nix-systems.follows = "nix-systems";
    };
    bookokrat = {
      url = "github:bugzmanov/bookokrat";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  flake.nixosModules.bookokrat = {
    home-manager.sharedModules = [ self.homeModules.bookokrat ];
  };

  flake.homeModules.bookokrat = withSystem "x86_64-linux" (
    { inputs', ... }: {
      home.packages = [
        inputs'.bookokrat.packages.default
      ];
    }
  );
}
