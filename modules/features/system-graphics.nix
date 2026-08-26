{ inputs, ... }:
{
  flake-file.inputs.system-graphics.url = "github:soupglasses/nix-system-graphics";
  flake-file.inputs.system-graphics.inputs.nixpkgs.follows = "nixpkgs";

  flake.nixosModules.system-graphics = {
    imports = [
      inputs.system-graphics.systemModules.default
    ];

    system-graphics.enable = true;
  };
}
