{ self, inputs, ... }:
{
  flake.nixosModules.systemFeatures = {
    imports = with self.nixosModules; [
      # dependencies
      homeManager
      systemGraphics

      # system settings
      apparmor
      systemd
      gdm
      gtk
      keyd
      displays
      ssh
      xdg
      fonts

      # desktop environment
      noctalia
      labwc

      # command lint tools
      delta
      jujutsu
      fish
      atuin
      bash
      btop
      git
      just
      k8s
      podman
      sql
      mise
      starship
      python
      neovim
      yazi
      vim
      shell
      lazygit
      github
      fastfetch
      zellij

      # graphical applications
      onepassword
      chromium
      foot
      ghostty
      obsidian
      teams
      librewolf
      bruno
      gram
    ];
  };

  # nixos (system-manager) configuration
  flake.nixosModules.systemConfiguration = { pkgs, ... }: {
    imports = [ self.nixosModules.systemFeatures ];

    environment.systemPackages = [
      pkgs.coreutils
      pkgs.libinput
    ];

    nixpkgs.hostPlatform = "x86_64-linux";
    nixpkgs.config.allowUnfree = true;

    nix.enable = true;
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "thomas" ];
      auto-optimise-store = true;
      trusted-substituters = [
        "https://cache.nixos.org/"
        "https://cache.numtide.com"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
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

  # TODO: move packages to separate modules

  # home(-manager) configuration
  flake.homeModules.homeConfiguration = { pkgs, ... }: {
    home.packages = [
      # command line tools, etc
      pkgs.dust
      pkgs.tokei
      pkgs.wlrctl
      pkgs.systemctl-tui
      pkgs.thinkfan
      pkgs.nix-tree
      pkgs.wl-color-picker
      pkgs.lazyjournal
      pkgs.doxx
      # gui applications
      pkgs.slack
      pkgs.spotify
      pkgs.localsend
      pkgs.signal-desktop
      pkgs.element-desktop
      pkgs.tutanota-desktop
      pkgs.protonmail-desktop
      pkgs.qalculate-gtk
    ];

    home.stateVersion = "26.11"; # TODO ?
    home.sessionPath = [ "$HOME/.local/bin" ];
    home.sessionVariables = { };

    # TODO: move programs to separate modules

    programs.fzf = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
    };
    programs.television.enable = false;
    programs.jq.enable = true;
    programs.parallel.enable = false;
    programs.ranger.enable = false;
    programs.man.generateCaches = false;

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
