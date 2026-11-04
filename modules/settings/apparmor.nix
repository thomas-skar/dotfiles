{
  flake.nixosModules.apparmor = {
    environment.etc."apparmor.d/nix-chrome-sandbox".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-chrome-sandbox /nix/store/**/libexec/electron/chrome-sandbox flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-bwrap".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-bwrap /nix/store/**/bin/bwrap flags=(unconfined) {
        userns,
        include if exists <local/bwrap>
      }
    '';
  };
}
