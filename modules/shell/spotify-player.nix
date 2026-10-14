{
  flake.homeModules.spotify-player = {
    programs.spotify-player = {
      enable = true;
      settings = {
        login_redirect_uri = "http://127.0.0.1:8989/login";
        theme = "default";
        enable_media_control = true;
        enable_streaming = "DaemonOnly";
        enable_audio_visualization = true;
        enable_notify = false;
        enable_cover_image_cache = true;
        border_type = "Rounded";
        progress_bar_type = "Line";
        genre_num = 5;
        layout = {
          library = {
            album_percent = 33;
            playlist_percent = 33;
          };
          playback_window_position = "Bottom";
          playback_window_height = 6;
        };
      };
      actions = [ ];
      keymaps = [ ];
      themes = [ ];
    };

    programs.fish.shellAbbrs = {
      sp = "spotify_player";
    };
  };
}
