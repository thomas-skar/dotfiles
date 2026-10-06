{ inputs, ... }:
{
  flake.nixosModules.system-graphics = {
    imports = [ inputs.system-graphics.systemModules.default ];

    system-graphics.enable = true;
  };
}
