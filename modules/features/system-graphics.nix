{ inputs, ... }:
{
  flake.nixosModules.systemGraphics = {
    imports = [ inputs.system-graphics.systemModules.default ];

    system-graphics.enable = true;
  };
}
