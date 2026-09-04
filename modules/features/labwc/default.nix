{ self, ... }:
{
  flake.nixosModules.labwc = {
    home-manager.sharedModules = [ self.homeModules.labwc ];
  };

  flake.homeModules.labwc = { pkgs, ... }: {
    home.packages = [
      pkgs.labwc-tweaks
      pkgs.labwc-menu-generator
    ];

    wayland.windowManager.labwc = {
      enable = true;
      package = pkgs.labwc;
      autostart = [ "/opt/intility/idn/Intility.DesktopNotifications.Client.Linux" ];
      environment = [
        "XKB_DEFAULT_LAYOUT=no"
        "XDG_CURRENT_DESKTOP=labwc:wlroots"
        "XDG_SESSION_TYPE=wayland"
        "XCURSOR_THEME=Adwaita"
        "QA_QPA_PLATFORM=wayland"
      ];
      systemd.enable = true;
    };

    home.file.".config/labwc/menu.xml".source = ./menu.xml;
    home.file.".config/labwc/rc.xml".source = ./rc.xml;
    home.file.".local/share/themes/nix/labwc/themerc".source = ./themerc;
  };

}
