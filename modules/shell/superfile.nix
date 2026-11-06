{
  flake.homeModules.superfile = { pkgs, config, ... }: {
    programs.superfile = {
      enable = true;

      package = pkgs.superfile;
      zoxidePackage = pkgs.zoxide;
      metadataPackage = pkgs.exiftool;

      firstUseCheck = false;
      settings = {
        auto_check_update = false;
        cd_on_quit = false;
        theme = "0x96f";
        code_previewer = if config.programs.bat.enable then "bat" else "";
        nerdfont = true;
        sidebar_sections = [
          "home"
          "pinned"
        ];
        metadata = true;
        zoxide_support = true;
      };
      themes = { };
      hotkeys = { };
      pinnedFolders = [ ];
    };

    programs.fish.shellAbbrs = {
      sf = "superfile";
    };
  };
}
