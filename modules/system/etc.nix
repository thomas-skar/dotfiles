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

    profile nix_1password /nix/store/**/bin/1password flags=(unconfined) {
      userns,
    }
  '';

  # TODO: this one doesn't register for some reason...
  environment.etc."apparmor.d/nix-bruno".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix_bruno /nix/store/**/bin/bruno flags=(unconfined) {
      userns,
    }
  '';

  environment.etc."apparmor.d/nix-chromium".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix_chromium /nix/store/**/bin/chromium flags=(unconfined) {
      userns,
    }
  '';

  environment.etc."apparmor.d/nix-slack".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix_slack /nix/store/**/bin/slack flags=(unconfined) {
      userns,
    }
  '';

  environment.etc."apparmor.d/nix-obsidian".text = ''
    abi <abi/4.0>,
    include <tunables/global>

    profile nix_obsidian /nix/store/**/bin/obsidian flags=(unconfined) {
      userns,
    }
  '';
}
