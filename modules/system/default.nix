{ self, inputs, ... }:
{
  flake.systemConfigs.default = inputs.system-manager.lib.makeSystemConfig {
    modules = [ self.nixosModules.systemConfig ];
  };

  flake.systemConfigs.x86_64-linux.systemConfigs.default = self.systemConfigs.default;
}
