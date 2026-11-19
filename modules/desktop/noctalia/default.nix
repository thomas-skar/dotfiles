{ inputs, ... }:
{
  flake.nixosModules.noctalia = {
    nix.settings = {
      trusted-substituters = [ "https://noctalia.cachix.org" ];
      trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };

    home-manager.sharedModules = [
      {
        imports = [ inputs.noctalia.homeModules.default ];

        # disabledModules = [
        #   "programs/noctalia.nix"
        #   "programs/noctalia"
        # ];

        programs.noctalia = {
          enable = true;
          systemd.enable = false;
        };

        xdg.configFile."noctalia/config.toml" = {
          source = ./config.toml;
          force = true;
        };

        xdg.configFile."noctalia/palettes/custom.json" = {
          source = ./palette.json;
          force = true;
        };

        xdg.desktopEntries."dev.noctalia.Noctalia" = {
          name = "Noctalia";
          noDisplay = true;
        };
      }
    ];
  };
}
