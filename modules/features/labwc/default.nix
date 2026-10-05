{ self, inputs, ... }:
{
  flake.nixosModules.labwc = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.labwc ];

    environment.variables = {
      WLR_BACKEND = "wayland,libinput,drm";
      WLR_RENDERER = "vulkan";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      WLR_RENDERER_FORCE_SOFTWARE = "0";
      WLR_NO_HARDWARE_CURSORS = "1";
      XKB_DEFAULT_LAYOUT = "no";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };

    home-manager.sharedModules = [ self.homeModules.labwc ];
  };

  flake.homeModules.labwc = { pkgs, ... }: {
    home.packages = [
      # pkgs.labwc-tweaks
      # pkgs.labwc-menu-generator
      pkgs.wlrctl
      pkgs.lswt
      inputs.run-or-raise.packages."x86_64-linux".run-or-raise
    ];

    wayland.windowManager.labwc = {
      enable = true;
      package = pkgs.labwc;
      autostart = [ ];
      environment = [
        "XKB_DEFAULT_LAYOUT=no"
        "XDG_CURRENT_DESKTOP=labwc:wlroots"
        "XDG_SESSION_TYPE=wayland"
        "XCURSOR_THEME=Adwaita"
        "QA_QPA_PLATFORM=wayland"
        "TMPDIR=$HOME/tmp"
        "WLR_BACKEND=wayland,libinput,drm"
        "WLR_RENDERER=vulkan"
        "WLR_RENDERER_ALLOW_SOFTWARE=1"
        "WLR_RENDERER_FORCE_SOFTWARE=0"
        "WLR_NO_HARDWARE_CURSORS=1"
        "ELECTRON_OZONE_PLATFORM_HINT=wayland"
        "GDK_DEBUG=no-portals"
      ];
      systemd.enable = true;
    };

    home.file.".config/labwc/menu.xml".source = ./menu.xml;
    home.file.".config/labwc/rc.xml".source = ./rc.xml;
    home.file.".local/share/themes/nix/labwc/themerc".source = ./themerc;
  };

}
