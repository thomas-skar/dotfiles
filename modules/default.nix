{ inputs, lib, ... }:
{
  debug = false;

  systems = [ "x86_64-linux" ];

  imports = [
    inputs.flake-file.flakeModules.dendritic # flake-file + flake+parts + import-tree
    inputs.home-manager.flakeModules.home-manager
  ];

  # TODO: figure out a way to declare overylays in the same module as the flake input
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays =
          [ ]
          ++ (if lib.hasAttr "nur" inputs then [ inputs.nur.overlays.default ] else [ ])
          ++ (if lib.hasAttr "apple-fonts" inputs then [ inputs.apple-fonts.overlays.default ] else [ ])
          ++ (
            if lib.hasAttr "obsidian-extensions" inputs then
              [ inputs.obsidian-extensions.overlays.default ]
            else
              [ ]
          );
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
