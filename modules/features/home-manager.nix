{ self, inputs, ... }:
{
  flake-file.inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.homeManager = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      startAsUserService = false;
      backupFileExtension = "bak";
      overwriteBackup = true;
      sharedModules = [ self.homeModules.homeManager ];
    };
  };

  flake.homeModules.homeManager = {
    programs.home-manager.enable = true;
  };
}
