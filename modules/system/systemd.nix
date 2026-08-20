{
  # TODO: restart services @ every switch !

  systemd.services."apparmor-profiles" = {
    enable = true;
    description = "register custom apparmor nix-* profiles";
    wantedBy = [ "system-manager.target" ];
    script = builtins.readFile ../../scripts/apparmor.sh;
  };

  systemd.services."icon-permissions" = {
    enable = true;
    description = "fix icon directory permissions";
    wantedBy = [ "system-manager.target" ];
    script = builtins.readFile ../../scripts/icon-permissions.sh;
    scriptArgs = "thomas";
  };

  systemd.services."nix-store-permissions" = {
    enable = true;
    description = "fix /nix/store permissions";
    wantedBy = [ "system-manager.target" ];
    script = builtins.readFile ../../scripts/nix-store-permissions.sh;
  };

  systemd.services."rip-gdm" = {
    enable = true;
    description = "kill gdm";
    wantedBy = [ "system-manager.target" ];
    wants = [ "gdm.service" ];
    after = [ "gdm.service" ];
    script = ''
      /usr/bin/systemctl stop gdm || /usr/bin/echo "failed to stop gdm!"
    '';
  };
}
