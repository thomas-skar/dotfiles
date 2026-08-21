{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

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
        icon_size = 24;
        magnification = true;
        monitors = [ "eDP-1" ];
        reserve_space = false;
        show_dots = true;
      };

      location.address = "Oslo, Norway";

      lockscreen.monitors = [ "eDP-1" ];
      lockscreen_widgets.enabled = false;

      notification.monitors = [ "eDP-1" ];

      osd.monitors = [ "eDP-1" ];

      plugins.enabled = [ ];
      plugins.source = [
        {
          name = "official";
          enabled = false;
        }
        {
          name = "community";
          enabled = false;
        }
      ];

      shell = {
        polkit_agent = true;
        launch_apps_as_systemd_services = false;

        launcher = {
          categories = false;
          compact = true;
          fetch_exchange_rates = false;
          sort_by_usage = false;
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
          enable_builtin_templates = false;
          enable_community_templates = false;
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

  # inspo:
  #   - https://github.com/noctalia-dev/community-palettes/blob/main/Mine/Mine.json
  #   - https://github.com/noctalia-dev/community-palettes/blob/main/Monochrome/Monochrome.json
  home.file.".config/noctalia/palettes/custom.json".source = ./palette.json;
}
