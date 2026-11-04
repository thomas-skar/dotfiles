{
  flake.nixosModules.microsoft-teams = { pkgs, ... }: {

    environment.etc."apparmor.d/nix-teams".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-teams /nix/store/**/bin/teams-for-linux flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [
      {
        home.packages = [
          pkgs.teams-for-linux
        ];

        home.file.".config/teams-for-linux/config.json".text = ''
          {
            "auth": {
              "intune": {
                "enabled": true,
                "user": "thomas.skar@intility.no"
              }
            }
          }
        '';
      }
    ];

  };
}
