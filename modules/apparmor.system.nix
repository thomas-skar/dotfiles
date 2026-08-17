{
  environment.etc = {
    "apparmor.d/nix-1password".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix_1password /nix/store/**/bin/1password flags=(unconfined) {
        userns,
      }
    '';

    "apparmor.d/nix-bruno".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix_bruno /nix/store/**/bin/bruno flags=(unconfined) {
        userns,
      }
    '';

    "apparmor.d/nix-chromium".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix_chromium /nix/store/**/bin/chromium flags=(unconfined) {
        userns,
      }
    '';

    "apparmor.d/nix-slack".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix_slack /nix/store/**/bin/slack flags=(unconfined) {
        userns,
      }
    '';

    "apparmor.d/nix-obsidian".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix_obsidian /nix/store/**/bin/obsidian flags=(unconfined) {
        userns,
      }
    '';
  };

  systemd.services."apparmor-profiles" = {
    enable = true;
    description = "register custom apparmor nix-* profiles";
    wantedBy = [ "system-manager.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = builtins.readFile ./scripts/apparmor.sh;
  };
}
