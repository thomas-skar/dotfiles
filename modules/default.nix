{ inputs, lib, ... }:
{
  debug = false;

  systems = [ "x86_64-linux" ];

  imports = [
    inputs.home-manager.flakeModules.home-manager
  ];

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
}
