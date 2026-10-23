{ withSystem, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      version = "v1.2";
    in
    {
      packages.windows = pkgs.stdenv.mkDerivation {
        pname = "windows";
        version = version;

        src = pkgs.fetchFromGitHub {
          owner = "RadioNoiseE";
          repo = "windows";
          rev = version;
          sha256 = "sha256-svzCT+dwzXIbGKWsKBodsuf5YeqW3DJjEfx7IkA8Ie0=";
        };

        buildInputs = [
          pkgs.cairo
          pkgs.wayland-protocols
          pkgs.libxkbcommon
        ];

        nativeBuildInputs = [
          pkgs.pkg-config
          pkgs.wayland-scanner
        ];

        installPhase = ''
          runHook preInstall
          mkdir -p $out/bin
          cp windows $out/bin
          runHook postInstall
        '';

      };
    };

  flake.homeModules.windows = withSystem "x86_64-linux" (
    { config, ... }: {
      home.packages = [ config.packages.windows ];
    }
  );
}
