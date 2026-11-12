{
  flake.homeModules.yaak =
    { pkgs, ... }:
    let
      yaak = pkgs.yaak.overrideAttrs (old: {
        tauriBuildFlags = [
          "--config"
          "./tauri.linux.conf.json"
        ];
        buildInputs = old.buildInputs ++ [
          pkgs.libgit2
          pkgs.sqlite
        ];
      });
    in
    {
      home.packages = [
        yaak
      ];
    };
}
