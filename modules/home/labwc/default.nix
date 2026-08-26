{ pkgs, ... }:
{
  home.packages = [
    pkgs.labwc-tweaks
    pkgs.labwc-menu-generator

    # https://github.com/labwc/labwc-themes
    pkgs.meson
    pkgs.ninja
  ];

  # TODO: repliace parts of https://labwc.github.io/obligatory-screenshot2.html

  wayland.windowManager.labwc = {
    enable = true;
    package = pkgs.labwc;
    autostart = [
      "/opt/intility/idn/Intility.DesktopNotifications.Client.Linux &"
      "noctalia"
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

  home.file.".local/share/themes/nix/labwc/themerc".source = ./themerc;
}
