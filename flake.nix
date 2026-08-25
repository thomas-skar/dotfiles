{
  description = "Standalone System Manager configuration";

  nixConfig = {
    extra-substituters = [ "https://cache.numtide.com" ];
    extra-trusted-public-keys = [ "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-system-graphics = {
      url = "github:soupglasses/nix-system-graphics";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia.url = "github:noctalia-dev/noctalia/cachix";

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      self,
      system-manager,
      home-manager,
      nix-system-graphics,
      ...
    }@inputs:
    let
      username = "thomas";
      system = "x86_64-linux";
      specialArgs = { inherit inputs username system; };
    in
    {
      systemConfigs.default = system-manager.lib.makeSystemConfig {
        specialArgs = specialArgs;
        modules = [
          ./modules/system

          nix-system-graphics.systemModules.default
          {
            system-graphics.enable = true;
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              startAsUserService = false;
              backupFileExtension = "bak";
              overwriteBackup = true;
              users."${username}" = import ./modules/home;
              extraSpecialArgs = specialArgs;
            };
          }
        ];
      };

      systemConfigs.x86_64-linux.systemConfigs.default = self.systemConfigs.default;
    };
}
