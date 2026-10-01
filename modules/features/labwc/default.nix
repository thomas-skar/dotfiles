{ self, ... }:
{
  flake.nixosModules.labwc = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.labwc ];

    environment.variables = {
      WLR_BACKEND = "wayland,libinput,drm";
      WLR_RENDERER = "vulkan";
      WLR_RENDERER_ALLOW_SOFTWARE = "1";
      WLR_RENDERER_FORCE_SOFTWARE = "0";
      WLR_NO_HARDWARE_CURSORS = "1";
      # WAYLAND_DISPLAY = "wayland-0";
      # DISPLAY = ":0";
      # XDG_SESSION_ID = "1";
      XKB_DEFAULT_LAYOUT = "no";
      # GTK_THEME = "Adwaita";
      QT_QPA_PLATFORM = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    };

    systemd.services."wayland-compositor" = {
      enable = false;
      after = [
        "graphical.target"
        "systemd-user-sessions.service"
        "modprobe@drm.service"
      ];
      conflicts = [ "getty@tty2.service" ];
      serviceConfig = {
        User = "thomas";
        WorkingDirectory = "~";
        PAMName = "login";
        TTYPath = "/dev/tty2";
        UnsetEnvironment = "TERM";
        StandardOutput = "journal";
        ExecStart = "${pkgs.labwc}/bin/labwc";
      };
      wantedBy = [ "graphical.target" ];
    };

    home-manager.sharedModules = [ self.homeModules.labwc ];
  };

  flake.homeModules.labwc = { pkgs, config, ... }: {
    home.packages = [
      pkgs.labwc-tweaks
      pkgs.labwc-menu-generator
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
        # "GTK_THEME=Adwaita:dark"
        "ELECTRON_OZONE_PLATFORM_HINT=wayland"
      ];
      systemd.enable = true;
    };

    home.file.".config/labwc/menu.xml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/labwc/menu.xml";
    home.file.".config/labwc/rc.xml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/labwc/rc.xml";

    home.file.".local/share/themes/nix/labwc/themerc".source = ./themerc;
  };

}
