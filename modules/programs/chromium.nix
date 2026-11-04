{
  flake.nixosModules.chromium = { pkgs, ... }: {
    environment.etc."apparmor.d/nix-chromium".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-chromium /nix/store/**/bin/chromium flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [
      {
        programs.chromium = {
          enable = true;
          package = pkgs.chromium; # TODO: ungoogled-chromium
        };
      }
    ];
  };
}
