{ self, ... }:
{
  flake.nixosModules.systemConfig = { pkgs, ... }: {
    imports = [ self.nixosModules.systemModuleBundle ]; # ./bundles.nix

    environment.systemPackages = [ pkgs.coreutils ];

    nix.enable = true;
    nix.settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "thomas" ];
      auto-optimise-store = true;
      trusted-substituters = [
        "https://cache.nixos.org/"
        "https://cache.numtide.com"
        "https://noctalia.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
      sync-before-registering = true;
    };

    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;

    system.autoUpgrade.enable = false;

    services.userborn.enable = true;

    users.users."thomas" = {
      enable = true;
      isNormalUser = true;
      createHome = false;
      uid = 1000;
      group = "thomas";
      extraGroups = [ ];
      home = "/home/thomas";
      homeMode = "700";
      shell = "/etc/profiles/per-user/thomas/bin/fish";
      useDefaultShell = true;
    };

    users.groups."thomas".gid = 1000;

    home-manager.users."thomas" = self.homeModules.userConfig;
  };

  flake.homeModules.userConfig = { pkgs, ... }: {
    imports = [ self.homeModules.userModuleBundle ]; # ./bundles.nix

    home.packages = [
      # command line tools, etc
      pkgs.gh
      pkgs.dust
      pkgs.usage
      pkgs.tokei
      pkgs.wlrctl
      pkgs.sqlite
      pkgs.systemctl-tui
      pkgs.systemd-manager-tui
      pkgs.thinkfan
      pkgs.nix-tree
      pkgs.wl-color-picker
      # gui applications
      pkgs.bruno
      pkgs.slack
      pkgs.spotify
      pkgs.localsend
      pkgs._1password-gui
      pkgs.signal-desktop
      pkgs.element-desktop
      pkgs.tutanota-desktop
      pkgs.protonmail-desktop
      pkgs.jetbrains.goland
      pkgs.jetbrains.pycharm
      pkgs.qalculate-gtk
      # miscellaneous
      pkgs.gnome-themes-extra
      pkgs.whitesur-icon-theme
    ];

    home.stateVersion = "26.11";
    home.sessionPath = [ "$HOME/.local/bin" ];
    home.sessionVariables = { };

    programs.home-manager.enable = true;
    programs.bat.enable = true;
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
    programs.eza.enable = true;
    programs.fastfetch.enable = true;
    programs.fd.enable = true;
    programs.fzf = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
    };
    programs.ripgrep.enable = true;
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.vim.enable = true;
    programs.neovim.enable = false;
    programs.yazi.enable = true;
    programs.mise = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.direnv = {
      enable = true;
      mise.enable = true;
    };
    programs.television.enable = true;
    programs.zellij.enable = false;
    programs.delta.enable = true;
    programs.jq.enable = true;
    programs.parallel.enable = true;
    programs.ranger.enable = false;

    # theming
    gtk = {
      enable = true;

      theme.name = "Adwaita";
      iconTheme.name = "MacTahoe";
      cursorTheme.name = "Adwaita";

      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
  };
}
