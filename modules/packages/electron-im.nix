{
  withSystem,
  ...
}:
let
  version = "v0.0.123";
in
{
  perSystem = { pkgs, lib, ... }: {
    packages.electron-im = pkgs.stdenv.mkDerivation {
      pname = "electronim";
      version = version;

      # src = pkgs.fetchFromGitHub {
      #   owner = "manusa";
      #   repo = "electronim";
      #   rev = version;
      #   sha256 = "sha256-iIrJX9rjHYAQbEjTuXY//9o/k/p2DBJYKhN1DXClZAw=";
      # };

      src = pkgs.fetchzip {
        url = "https://github.com/manusa/electronim/releases/download/${version}/electronim-linux-x64.tar.gz";
        sha256 = "sha256-1ZvHmk7EK/i6A/4wWL6o/SymbBP1egdM6YiZsgVJCUQ=";
      };

      buildInputs = [
        pkgs.makeWrapper
      ];

      rpath = lib.makeLibraryPath [ ];

      installPhase = ''
        runHook preInstall

        mkdir -p $out/bin
        mkdir -p $out/lib
        mv * $out/lib
        # chmod -R g-w $out

        makeWrapper $out/lib/electronim $out/bin/electronim \
          --add-flags "\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime=true}}" \
          --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [ pkgs.stdenv.cc.cc.lib ]}

        # chown -R root $out/lib/chrome-sandbox
        chmod 755 $out/lib/chrome-sandbox

        runHook postInstall
      '';
    };
  };

  flake.nixosModules.electron-im = withSystem "x86_64-linux" (
    { config, ... }: {
      environment.etc."apparmor.d/nix-electronim".text = ''
        abi <abi/4.0>,
        include <tunables/global>

        profile nix-electronim /nix/store/**/bin/electronim flags=(unconfined) {
          userns,
          include if exists <local/bwrap>
        }
      '';

      environment.etc."apparmor.d/nix-electronim-chrome-sandbox".text = ''
        abi <abi/4.0>,
        include <tunables/global>

        profile nix-electronim-chrome-sandbox /nix/store/**/lib/chrome-sandbox flags=(unconfined) {
          userns,
          include if exists <local/bwrap>
        }
      '';

      home-manager.sharedModules = [ { home.packages = [ config.packages.electron-im ]; } ];
    }
  );

}
