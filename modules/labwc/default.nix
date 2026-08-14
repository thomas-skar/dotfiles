{ pkgs, ... }:
{
  wayland.windowManager.labwc = {
    enable = true;
    package = pkgs.labwc;
    autostart = [ "noctalia -d" ];
    environment = [
      "XKB_DEFAULT_LAYOUT=no"
      "XDG_CURRENT_DESKTOP=labwc:wlroots"
    ];
    systemd.enable = true;
  };

  home.file.".config/labwc/menu.xml".source = ./menu.xml;
  home.file.".config/labwc/rc.xml".source = ./rc.xml;
}
