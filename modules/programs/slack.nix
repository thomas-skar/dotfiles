{
  flake.nixosModules.slack = { pkgs, ... }: {
    environment.etc."apparmor.d/nix-slack".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-slack /nix/store/**/bin/slack flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [ { home.packages = [ pkgs.slack ]; } ];
  };
}
