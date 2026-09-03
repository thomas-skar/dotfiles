{
  flake.nixosModules.gdm = {
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

  };
}
