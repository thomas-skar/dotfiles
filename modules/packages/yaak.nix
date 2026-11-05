{ withSystem, ... }:
{
  flake.homeModules.yaak-package = withSystem "x86_64-linux" (
    { config, ... }: {
      home.packages = [ config.packages.yaak ];
    }
  );

  perSystem =
    { pkgs, ... }:
    let
      version = "2026.9.1";
    in
    {
      packages.yaak = pkgs.rustPlatform.buildRustPackage (finalAttrs: {
        pname = "yaak";
        version = version;

        src = pkgs.fetchFromGitHub {
          owner = "mountain-loop";
          repo = "yaak";
          rev = "v${finalAttrs.version}";
          sha256 = "sha256-etNB9fnPPast7+ecjiD900u/9UOXqcLO/10EWGy8CHk=";
        };

        npmDeps = pkgs.fetchNpmDeps {
          inherit (finalAttrs) src;
          hash = "sha256-iosKkjM2jhSqbWtHPpdPAcyFcQu5A/Q8RuRJIJ3/zi8=";
          fetcherVersion = 2;
        };

        cargoHash = "sha256-3jGRKbFrHimIkjQRPUIBS1fuF8kvc0kWuqBOpFgEHRo=";

        cargoRoot = ".";
        buildAndTestSubdir = "crates-tauri/yaak-app-client";

        patches = [ ];

        nativeBuildInputs = [
          pkgs.cargo-tauri.hook
          pkgs.npmHooks.npmConfigHook
          pkgs.pkg-config
          pkgs.nodejs
          pkgs.python3
          pkgs.protobuf
          pkgs.perl
          pkgs.makeWrapper
          pkgs.lld
          pkgs.wasm-pack
          pkgs.wasm-bindgen-cli_0_2_121
          pkgs.wrapGAppsHook3
          pkgs.autoPatchelfHook
        ];

        buildInputs = [
          pkgs.glib
          pkgs.gtk3
          pkgs.openssl
          pkgs.pango
          pkgs.cairo
          pkgs.pixman
          pkgs.librsvg
          pkgs.gdk-pixbuf
          pkgs.adwaita-icon-theme
          pkgs.webkitgtk_4_1
        ];

        env.ELECTRON_SKIP_BINARY_DOWNLOAD = "1";
        env.SSL_CERT_FILE = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
        env.YAAK_CLI_NO_UPDATE_CHECK = "1";
        env.CC_wasm32_unknown_unknown = "${pkgs.llvmPackages.clang.cc}/bin/clang";

        dontAutoPatchelf = true;

        postPatch = ''
          substituteInPlace package.json \
            --replace-fail '"version": "0.0.0"' '"version": "${finalAttrs.version}"'

          substituteInPlace crates-tauri/yaak-app-client/tauri.conf.json \
            --replace-fail '"0.0.0"' '"${finalAttrs.version}"'

          substituteInPlace crates-tauri/yaak-app-client/tauri.release.conf.json \
            --replace-fail '"createUpdaterArtifacts": true' '"createUpdaterArtifacts": false' \
            --replace-fail '"https://update.yaak.app/check/{{target}}/{{arch}}/{{current_version}}"' '"https://non.existent.domain"'
          # --replace-fail '"features": ["updater", "license", "wry"]' '"features": ["updater", "wry"]' \

          substituteInPlace package.json \
            --replace-fail '"vendor:vendor-node": "node scripts/vendor-node.cjs",' "" \
            --replace-fail '"vendor:vendor-protoc": "node scripts/vendor-protoc.cjs",' ""

          substituteInPlace crates/yaak-templates/build-wasm.cjs crates/yaak-wasm/build-wasm.cjs \
            --replace-fail 'execSync("wasm-pack build' 'execSync("CARGO_BUILD_TARGET=wasm32-unknown-unknown wasm-pack build'
        '';

        preBuild = ''
          autoPatchelf node_modules/@yaakapp/cli-linux-x64/bin/yaak
          mkdir -p crates-tauri/yaak-app-client/vendored/node
          ln -s ${pkgs.nodejs}/bin/node crates-tauri/yaak-app-client/vendored/node/yaaknode
          mkdir -p crates-tauri/yaak-app-client/vendored/protoc
          ln -s ${pkgs.protobuf}/bin/protoc crates-tauri/yaak-app-client/vendored/protoc/yaakprotoc
          ln -s ${pkgs.protobuf}/include crates-tauri/yaak-app-client/vendored/protoc/include
        '';

        tauriBuildFlags = [
          "--config"
          "./tauri.linux.conf.json"
          # "./tauri.release.conf.json"
        ];

        doCheck = false;

        passthru.updateScript = pkgs.nix-update-script { };
      });
    };
}
