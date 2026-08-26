{ self, inputs, ... }:
{
  flake-file.inputs.system-manager.url = "github:numtide/system-manager";
  flake-file.inputs.system-manager.inputs.nixpkgs.follows = "nixpkgs";
  flake-file.inputs.system-manager.inputs.userborn.inputs.flake-parts.follows = "flake-parts";

  flake.systemConfigs.default = inputs.system-manager.lib.makeSystemConfig {
    modules = [ self.nixosModules.systemConfig ];
  };

  flake.systemConfigs.x86_64-linux.systemConfigs.default = self.systemConfigs.default;
}
