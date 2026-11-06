{
  flake.homeModules.yaak =
    { pkgs, ... }:
    let
      yaak = pkgs.yaak.overrideAttrs (_: {
        tauriBuildFlags = [
          "--config"
          "./tauri.linux.conf.json"
        ];
      });
    in
    {
      home.packages = [
        yaak
      ];
    };
}
