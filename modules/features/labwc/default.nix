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
      autostart = [
        "/opt/intility/idn/Intility.DesktopNotifications.Client.Linux &"
        "noctalia -d"
      ];
      environment = [
        "XKB_DEFAULT_LAYOUT=no"
        "XDG_CURRENT_DESKTOP=labwc:wlroots"
        "XCURSOR_THEME=Adwaita"
      ];
      systemd.enable = true;
    };

    home.file.".config/labwc/menu.xml".source = ./menu.xml;
    home.file.".config/labwc/rc.xml".source = ./rc.xml;
    home.file.".local/share/themes/nix/labwc/themerc".source = ./themerc;
  };

}
