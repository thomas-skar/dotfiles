{
  flake.nixosModules.protonmail = { pkgs, ... }: {
    environment.etc."apparmor.d/nix-proton-mail".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-proton-mail /nix/store/**/bin/proton-mail flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [ { home.packages = [ pkgs.protonmail-desktop ]; } ];
  };
}
