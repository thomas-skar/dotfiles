{
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

  environment.etc."pam.d/noctalia" = {
    enable = true;
    user = "root";
    group = "root";
    mode = "0644";
    text = ''
      #%PAM-1.0
      auth    requisite       pam_nologin.so
      auth    required        pam_succeed_if.so user != root quiet_success
      @include common-auth
      auth    optional        pam_gnome_keyring.so
      @include common-account
      session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so close
      session required        pam_loginuid.so
      session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so open
      session optional        pam_keyinit.so force revoke
      session required        pam_limits.so
      session required        pam_env.so readenv=1
      session required        pam_env.so readenv=1 user_readenv=1 envfile=/etc/default/locale
      @include common-session
      session optional        pam_gnome_keyring.so auto_start
      @include common-password
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
