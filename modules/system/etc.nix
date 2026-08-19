{
  # TODO: not sure if this is actually needed
  environment.etc."locale.conf" = {
    enable = true;
    user = "root";
    group = "root";
    mode = "0644";
    replaceExisting = true;
    text = ''
      LANG=nb_NO.UTF-8
    '';
  };

  environment.etc."apparmor.d/nix-1password".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix-1password /nix/store/**/bin/1password flags=(unconfined) {
      userns,
    }
  '';

  # TODO: this one doesn't register for some reason...
  environment.etc."apparmor.d/nix-bruno".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix-bruno /nix/store/**/bin/bruno flags=(unconfined) {
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

  environment.etc."apparmor.d/nix-teams-electron".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix-teams-electron /nix/store/**/libexec/electron/chrome-sandbox flags=(unconfined) {
      userns,
    }
  '';

}
