{ inputs, ... }:
{
  systems = [ "x86_64-linux" ];

  imports = [
    inputs.flake-file.flakeModules.dendritic # flake-file + flake+parts + import-tree
    # inputs.flake-file.flakeModules.allfollow
    # inputs.flake-file.flakeModules.nix-auto-follow
    inputs.flake-parts.flakeModules.modules
    # inputs.flake-parts.flakeModules.flakeModules
    inputs.home-manager.flakeModules.home-manager
  ];

  flake-file.inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    flake-file.url = "github:vic/flake-file";
  };
}
