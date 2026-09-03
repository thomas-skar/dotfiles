{ inputs, ... }:
{
  flake-file.inputs.system-graphics = {
    url = "github:soupglasses/nix-system-graphics";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.systemGraphics = {
    imports = [ inputs.system-graphics.systemModules.default ];

    system-graphics.enable = true;
  };
}
