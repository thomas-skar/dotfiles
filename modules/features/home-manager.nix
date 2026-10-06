{ self, inputs, ... }:
{
  flake.nixosModules.home-manager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      startAsUserService = false;
      backupFileExtension = "bak";
      overwriteBackup = true;
      sharedModules = [ self.homeModules.home-manager ];
    };
  };

  flake.homeModules.home-manager = {
    programs.home-manager.enable = true;
  };
}
