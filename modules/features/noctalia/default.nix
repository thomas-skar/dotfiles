{ inputs, ... }:
{
  flake-file = {
    inputs.noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixConfig = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };

  flake.homeModules.noctalia = {
    imports = [ inputs.noctalia.homeModules.default ];

    home.file.".config/noctalia/palettes/custom.json".source = ./palette.json;

    programs.noctalia = {
      enable = true;
      systemd.enable = false;
      settings = {
        audio = {
          enable_sounds = true;
          enable_overdrive = true;
        };
        bar.default = {
          margin_ends = 0;
          widget_spacing = 14;
          start = [
            "workspaces"
            "spacer_start"
            "active_window"
          ];
          center = [
            "date"
          ];
          end = [
            "tray"
            "spacer_end"
            "sysmon"
            "notifications"
            "network"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
            "session"
          ];
        };
        control_center = {
          sidebar = "full";
          sidebar_section = "none";
          calendar = {
            show_events_card = true;
            show_week_numbers = true;
          };
        };

        desktop_widgets.enabled = false;
        dock = {
          enabled = true;
          background_opacity = 0.75;
          icon_size = 32;
          magnification = true;
          monitors = [ "eDP-1" ];
          reserve_space = false;
          show_dots = true;
        };
        idle = {
          behavior_order = [
            "lock"
            "screen-off"
            "lock-and-suspend"
          ];
          behaviour = {
            lock = {
              action = "lock";
              enabled = true;
              timeout = 180.0;
            };
            screen-off = {
              action = "screen_off";
              enabled = true;
              timeout = 300.0;
            };
            lock-and-suspend = {
              action = "lock_and_suspend";
              enabled = true;
              timeout = 600.0;
            };
          };
        };
        location.address = "Oslo, Norway";
        lockscreen = {
          allow_empty_password = true;
          monitors = [ "eDP-1" ];
        };
        lockscreen_widgets.enabled = false;
        osd.monitors = [ "eDP-1" ];
        plugins = {
          enabled = [ ];
          source = [
            {
              name = "official";
              enabled = false;
            }
            {
              name = "community";
              enabled = false;
            }
          ];
        };
        shell = {
          polkit_agent = true;
          launch_apps_as_systemd_services = false;
          launcher = {
            categories = false;
            compact = true;
            fetch_exchange_rates = false;
            sort_by_usage = false;
            show_icons = false;
            providers.calculator.global = false;
          };
          panel = {
            open_near_click_session = true;
            open_near_click_control_center = true;
          };
        };
        theme = {
          mode = "dark";
          source = "custom";
          custom_palette = "custom";
          templates = {
            enable_builtin_templates = true;
            enable_community_templates = false;
            builtin_ids = [
              "gtk3"
              "gtk4"
              "labwc"
              "qt"
            ];
          };
        };
        wallpaper.directory = "/usr/share/backgrounds";
        weather.enabled = true;
        widget = {
          active_window.interactive = false;
          date = {
            anchor = true;
            format = "{:%a %d %b - %H:%M}";
          };
          network = {
            show_label = false;
            vpn_status = "both";
          };
          spacer_start.type = "spacer";
          spacer_end = {
            type = "spacer";
            length = 33;
          };
          sysmon = {
            show_value = false;
            visualization = "none";
          };
        };
      };
    };
  };
}
