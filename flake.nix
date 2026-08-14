{
  description = "Standalone System Manager configuration";

  nixConfig = {
    extra-substituters = [ "https://cache.numtide.com" ];
    extra-trusted-public-keys = [ "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=" ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    system-manager.url = "github:numtide/system-manager";
    # system-manager.inputs.nixpkgs.follows = "nixpkgs"; # TODO: broken atm

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-system-graphics.url = "github:soupglasses/nix-system-graphics";
    nix-system-graphics.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs =
    {
      self,
      nixpkgs,
      system-manager,
      home-manager,
      nix-system-graphics,
      noctalia,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      specialArgs = { inherit inputs system; };
    in
    {
      systemConfigs.default = system-manager.lib.makeSystemConfig {
        modules = [
          ./system.nix

          nix-system-graphics.systemModules.default
          {
            system-graphics.enable = true;
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bak";
              startAsUserService = false;
              users.thomas.imports = [
                ./home.nix
              ];
              extraSpecialArgs = specialArgs;
            };
          }
        ];
      };
    };
}
