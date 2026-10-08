{
  flake.nixosModules.ly = { pkgs, ... }: {
    environment = {
      systemPackages = [ pkgs.ly ];
      pathsToLink = [ "/share/ly" ];
      # etc."ly/config.ini".source = ./config.ini;
    };

    systemd.services."ly" = {
      enable = true;
      after = [
        "getty@tty1.service"
        "systemd-user-sessions.service"
        "plymouth-quit-wait.service"
      ];
      conflicts = [
        "getty@tty1.service"
        "gdm.service"
        "kmsconvt@%i.service"
        "ly-kmsconvt@%i.service"
      ];
      serviceConfig = {
        ExecStart = "/usr/sbin/agetty -nl ${pkgs.ly}/bin/ly %I $TERM";
        Type = "idle";
        Restart = "always";
        RestartSec = "0";
        StandardInput = "tty";
        StandardOutput = "tty";
        TTYPath = "/dev/tty1";
        TTYReset = "yes";
        TTYVHangup = "yes";
        TTYVTDisallocate = "yes";
        IgnoreSIGPIPE = "no";
        SendSIGHUP = "yes";
      };
    };

  };
}
