{ inputs, system, ... }:
{
  programs.librewolf = {
    enable = true;
    profiles.default.extensions.packages =
      with inputs.nur.legacyPackages.${system}.repos.rycee.firefox-addons; [
        darkreader
        multi-account-containers
        ublock-origin
      ];
  };
}
