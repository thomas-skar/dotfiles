{ inputs, ... }:
{
  flake.homeModules.librewolf = {

    programs.librewolf = {
      enable = true;
      profiles.default.extensions.packages =
        with inputs.nur.legacyPackages.x86_64-linux.repos.rycee.firefox-addons; [
          darkreader
          multi-account-containers
          ublock-origin
        ];
    };

  };
}
