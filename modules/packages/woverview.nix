{ withSystem, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      version = "v0.3.0";
    in
    {
      packages.woverview = pkgs.stdenv.mkDerivation {
        pname = "woverview";
        version = version;

        src = pkgs.fetchFromGitHub {
          owner = "pebeto";
          repo = "woverview";
          rev = version;
          sha256 = "sha256-WrMXJN9eS/iWcIgF5A9GP38OkA9rBhP6pakfwoiZIfo=";
        };

        buildInputs = [
          pkgs.cairo
          pkgs.wayland
          pkgs.wayland-protocols
          pkgs.pkg-config
          pkgs.wayland-scanner
        ];
        nativeBuildInputs = [
          pkgs.pkg-config
          pkgs.rustc
          pkgs.cargo
        ];

        installPhase = ''
          runHook preInstall
          mkdir -p $out/bin
          # cp woverview $out/bin
          runHook postInstall
        '';
      };
    };

  flake.homeModules.woverview = withSystem "x86_64-linux" (
    { config, ... }: {
      home.packages = [ config.packages.woverview ];
    }
  );
}
