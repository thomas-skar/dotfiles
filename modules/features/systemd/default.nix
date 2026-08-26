{
  flake.nixosModules.systemd = {
    systemd.services."apparmor-profiles" = {
      enable = true;
      description = "register custom apparmor nix-* profiles";
      wantedBy = [ "system-manager.target" ];
      script = builtins.readFile ./scripts/apparmor.sh;
    };

    systemd.services."icon-permissions" = {
      enable = true;
      description = "fix icon directory permissions";
      wantedBy = [ "system-manager.target" ];
      script = builtins.readFile ./scripts/icon-permissions.sh;
      scriptArgs = "thomas"; # TODO
    };

    systemd.services."nix-store-permissions" = {
      enable = true;
      description = "fix /nix/store permissions";
      wantedBy = [ "system-manager.target" ];
      script = builtins.readFile ./scripts/nix-store-permissions.sh;
    };
  };
}
