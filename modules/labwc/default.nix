{ pkgs, ... }:
{
  home.packages = [
    pkgs.labwc-tweaks
  ];

  wayland.windowManager.labwc = {
    enable = true;
    package = pkgs.labwc;
    autostart = [
      "noctalia &" # TODO: if noctalia is enabled
      "/opt/intility/idn/Intility.DesktopNotifications.Client.Linux"
    ];
    environment = [
      "XKB_DEFAULT_LAYOUT=no"
      "XDG_CURRENT_DESKTOP=labwc:wlroots"
      "XCURSOR_THEME=Adwaita"
      "GTK_THEME=Adwaita:dark"
    ];
    systemd.enable = true;
  };

  home.file.".config/labwc/menu.xml".source = ./menu.xml;
  home.file.".config/labwc/rc.xml".source = ./rc.xml;
}
