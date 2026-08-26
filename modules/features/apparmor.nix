{
  # TODO: merge file with application feature modules?
  flake.nixosModules.apparmor = {

    environment.etc."apparmor.d/nix-1password".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-1password /nix/store/**/bin/1password flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-chromium".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-chromium /nix/store/**/bin/chromium flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-obsidian".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-obsidian /nix/store/**/bin/obsidian flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-slack".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-slack /nix/store/**/bin/slack flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-teams".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-teams /nix/store/**/bin/teams-for-linux flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-chrome-sandbox".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-chrome-sandbox /nix/store/**/libexec/electron/chrome-sandbox flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-signal-desktop".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-signal-desktop /nix/store/**/bin/signal-desktop flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-element-desktop".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-element-desktop /nix/store/**/bin/element-desktop flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-proton-mail".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-proton-mail /nix/store/**/bin/proton-mail flags=(unconfined) {
        userns,
      }
    '';

    environment.etc."apparmor.d/nix-bruno".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-bruno /nix/store/**/bin/bruno flags=(unconfined) {
        userns,
      }
    '';

  };
}
