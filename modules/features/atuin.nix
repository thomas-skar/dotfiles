{
  flake.homeModules.atuin = {
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      settings = {
        auto_sync = false;
        update_check = false;
        search_mode = "fuzzy";
        filter_mode = "directory"; # global, host, session, workspace, session-preload
        style = "auto";
        inline_height = 10;
        invert = false;
        show_preview = true;
        exit_mode = "return-query";
        show_help = false;
        show_tabs = true;
        enter_accept = false;
        keymap_mode = "auto";
        prefers_reduced_motion = true;
        workspaces = true;
      };
    };
  };
}
