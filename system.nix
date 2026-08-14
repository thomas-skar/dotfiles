{ pkgs, lib, ... }:
{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;

    # /etc/nix/nix.conf settings
    nix.enable = true;
    nix.settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "thomas" ];
      auto-optimise-store = true;
      trusted-substituters = [
        "https://cache.nixos.org/"
        "https://cache.numtide.com"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
      sync-before-registering = true;
    };

    environment.systemPackages = with pkgs; [
      curl
      keyd
    ];

    environment.etc."keyd/default.conf".text = ''
      [ids]
      *
      [main]
      leftshift+leftmeta+f23 = layer(hyper) # copilot key
      [hyper:C-M-S-A]
    '';

    services.userborn.enable = true;

    users.users.thomas = {
      enable = true;
      isNormalUser = true;
      createHome = true;
      uid = 1000;
      group = "thomas";
      extraGroups = [ ];
      home = "/home/thomas";
      homeMode = "700";
    };
    users.groups.thomas.gid = 1000;

    # https://github.com/NixOS/nixpkgs/blob/nixos-26.05/nixos/modules/services/hardware/keyd.nix
    systemd.services.keyd = {
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

    # "services.displayManager" isn't available w/ system-manager
    systemd.tmpfiles.rules = [
      "L+ /usr/share/wayland-sessions/labwc.desktop - - - - ${pkgs.labwc}/share/wayland-sessions/labwc.desktop"
      "L+ /etc/systemd/user/labwc-session.service - - - - ${pkgs.labwc}/share/systemd/user/labwc-session.service"
    ];
  };
}
