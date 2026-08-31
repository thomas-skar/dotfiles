{ self, inputs, ... }:
{
  # nixos (system-manager) modules from /modules/features/
  flake.nixosModules.systemFeatures.imports = with self.nixosModules; [
    homeManager
    systemGraphics
    keyd
    apparmor
    systemd
    gdm
    jetbrains
  ];

  # home(-manager) modules from /modules/features/
  flake.homeModules.homeFeatures.imports =
    with self.homeModules;
    [
      fish
      labwc
      noctalia
      atuin
      bash
      btop
      chromium
      displays
      # fonts
      foot
      ghostty
      git
      # gtk
      helix
      just
      k8s
      obsidian
      podman
      ssh
      starship
      teams
      xdg
      zed
      goland
      pycharm
    ]
    ++ [
      self.modules.homeManager.fonts
      self.modules.homeManager.librewolf
    ];

  # nixos (system-manager) configuration
  flake.nixosModules.systemConfiguration = { pkgs, ... }: {
    imports = [ self.nixosModules.systemFeatures ];

    environment.systemPackages = [ pkgs.coreutils ];

    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;

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

    home-manager.users."thomas" = self.homeModules.homeConfiguration;

  };

  # home(-manager) configuration
  flake.homeModules.homeConfiguration = { pkgs, ... }: {
    imports = [ self.homeModules.homeFeatures ];

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
      pkgs.lazyjournal
      # pkgs.harlequin
      pkgs.sqlit-tui
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
    programs.nix-index.enable = true;
    programs.lazysql.enable = false;

  };

  # system-manager flake input
  flake-file = {
    inputs = {
      system-manager = {
        url = "github:numtide/system-manager";
        inputs.nixpkgs.follows = "nixpkgs";
        inputs.flake-compat.follows = "flake-compat";
        inputs.userborn.inputs.systems.follows = "systems";
        inputs.userborn.inputs.flake-parts.follows = "flake-parts";
      };
      flake-compat = {
        url = "github:nixos/flake-compat";
        flake = false;
      };
      systems.url = "github:nix-systems/default";
    };
    nixConfig = {
      extra-substituters = [ "https://cache.numtide.com" ];
      extra-trusted-public-keys = [ "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g=" ];
    };
  };

  # system manager config(s)
  flake.systemConfigs.default = inputs.system-manager.lib.makeSystemConfig {
    modules = [ self.nixosModules.systemConfiguration ];
  };

  flake.systemConfigs.x86_64-linux.systemConfigs.default = self.systemConfigs.default;
}
