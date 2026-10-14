{
  flake.homeModules.ncspot = {
    programs.ncspot = {
      enable = true;
      settings = {
        initial_screen = "library";
        use_nerdfont = true;
        audio_cache = false;
        volnorm = false;
        default_keybindings = true;
        notify = false;
        bitrate = 320;
        library_tabs = [
          "tracks"
          "albums"
          "artists"
          "playlists"
          "browse"
        ];
        hide_display_names = true;
      };
    };
  };
}
