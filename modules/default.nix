{ inputs, ... }:
{
  debug = false;

  systems = [ "x86_64-linux" ];

  imports = [
    inputs.flake-file.flakeModules.dendritic # flake-file + flake+parts + import-tree
    inputs.home-manager.flakeModules.home-manager
  ];

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.nur.overlays.default
        inputs.apple-fonts.overlays.default
      ];
      config.allowUnfree = true;
    };
  };

  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    flake-file.url = "github:vic/flake-file";
  };
}
