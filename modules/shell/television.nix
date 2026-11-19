{
  flake.homeModules.television = { pkgs, config, ... }: {
    programs.television = {
      enable = true;
      enableZshIntegration = config.programs.zsh.enable;
      enableBashIntegration = config.programs.bash.enable;
      enableFishIntegration = config.programs.fish.enable;
      enableNushellIntegration = config.programs.nushell.enable;
      extraPackages = [
        pkgs.fd
        pkgs.bat
        pkgs.ripgrep
        pkgs.eza
      ];
      settings = {
        default_channel = "files";
        ui = {
          status_bar.hidden = false;
          preview_panel.hidden = false;
          help_panel.hidden = false;
        };
      };
      channels = {
        # TODO: only if tealdeer is installed
        tldr = {
          metadata = {
            name = "tldr";
            requirements = [ "tldr" ];
          };
          source.command = "tldr --list";
          preview.command = "tldr '{}'";
        };
      };
      # themes = { };
    };

    programs.nix-search-tv = {
      enable = true;
      enableTelevisionIntegration = true;
      settings = {
        indexes = [
          "nixpkgs"
          "home-manager"
          "nixos"
        ];
      };
    };
  };
}
