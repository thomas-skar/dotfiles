{
  flake.nixosModules.systemd = {
    systemd.services."apparmor-profiles" = {
      enable = true;
      description = "register custom apparmor nix-* profiles";
      wantedBy = [ "system-manager.target" ];
      script = builtins.readFile ./scripts/apparmor.sh;
    };

    systemd.services."nix-store-permissions" = {
      enable = true;
      description = "fix /nix/store permissions";
      wantedBy = [ "system-manager.target" ];
      script = builtins.readFile ./scripts/nix-store-permissions.sh;
    };

    systemd.services."xdg-permissions" = {
      enable = true;
      description = "fix misc xdg directory permissions";
      wantedBy = [ "system-manager.target" ];
      script = builtins.readFile ./scripts/xdg-permissions.sh;
      scriptArgs = "thomas";
    };
  };
}
