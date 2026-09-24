{ self, withSystem, ... }:
{
  flake-file.inputs.bookokrat = {
    url = "github:bugzmanov/bookokrat";
    inputs.nixpkgs.follows = "nixpkgs";
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
