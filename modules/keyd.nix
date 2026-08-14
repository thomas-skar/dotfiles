{ lib, pkgs, ... }:
{
  # package
  environment.systemPackages = [ pkgs.keyd ];

  # config file
  # TODO: rebind magic keyboard rcmd -> hyper
  environment.etc."keyd/default.conf".text = ''
  [ids]
  *

  [main]
  capslock = noop
  leftshift+leftmeta+f23 = layer(hyper)

  [hyper:C-M-S-A]
  '';

  # systemd service: https://github.com/NixOS/nixpkgs/blob/nixos-26.05/nixos/modules/services/hardware/keyd.nix
  systemd.services."keyd" = {
    description = "Keyd remapping daemon";
    documentation = [ "man:keyd(1)" ];
    wantedBy = [ "multi-user.target" ];
    restartTriggers = [];
    serviceConfig = {
      ExecStart = lib.getExe pkgs.keyd;
      Restart = "always";
      SupplementaryGroups = [
        "input"
      ];
      RuntimeDirectory = "keyd";
      # Hardening
      CapabilityBoundingSet = [
        "CAP_SYS_NICE"
        "CAP_IPC_LOCK"
      ];
      DeviceAllow = [
        "char-input rw"
        "/dev/uinput rw"
      ];
      ProtectClock = true;
      PrivateNetwork = true;
      ProtectHome = true;
      ProtectHostname = true;
      PrivateUsers = false;
      PrivateMounts = true;
      PrivateTmp = true;
      RestrictNamespaces = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      ProtectControlGroups = true;
      MemoryDenyWriteExecute = true;
      LockPersonality = true;
      ProtectProc = "invisible";
      SystemCallFilter = [
        "nice"
        "@system-service"
        "~@privileged"
      ];
      RestrictAddressFamilies = [ "AF_UNIX" ];
      RestrictSUIDSGID = true;
      IPAddressDeny = [ "any" ];
      NoNewPrivileges = true;
      ProtectSystem = "strict";
      ProcSubset = "pid";
      UMask = "0077";
    };
  };
}
