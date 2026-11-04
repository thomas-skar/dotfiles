{
  flake.nixosModules.signal = { pkgs, ... }: {
    environment.etc."apparmor.d/nix-signal-desktop".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-signal-desktop /nix/store/**/bin/signal-desktop flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [ { home.packages = [ pkgs.signal-desktop ]; } ];
  };
}
