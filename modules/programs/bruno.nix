{
  flake.nixosModules.bruno = { pkgs, ... }: {
    environment.etc."apparmor.d/nix-bruno".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-bruno /nix/store/**/bin/bruno flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [
      {
        home.packages = [ pkgs.bruno ];

        home.sessionVariables = {
          TMPDIR = "$HOME/tmp";
        };
      }
    ];
  };
}
