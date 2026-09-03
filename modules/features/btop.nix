{ self, ... }:
{
  flake.nixosModules.btop = {
    home-manager.sharedModules = [ self.homeModules.btop ];
  };

  flake.homeModules.btop = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        truecolor = true;
        force_tty = false;
        disable_mouse = false;
        rounded_corners = true;
        terminal_sync = true;
        graph_symbol = "braille";
        shown_boxes = "net proc mem cpu";
        proc_sorting = "cpu direct";
        proc_left = false;
        base_10_sizes = true;
        background_update = true;
        show_io_stat = true;
      };
    };
  };
}
