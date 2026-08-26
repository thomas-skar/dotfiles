{ inputs, ... }:
{
  flake.nixosModules.system-graphics = {
    imports = [
      inputs.nix-system-graphics.systemModules.default
    ];

    system-graphics.enable = true;
  };
}
