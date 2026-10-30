{
  self,
  inputs,
  lib,
  ...
}:
let
  nixosModules = with self.nixosModules; [
    # dependencies
    home-manager
    system-graphics

    # desktop environment
    labwc
    noctalia

    # settings
    sql
    xdg
    apparmor

    # services
    gdm
    keyd
    podman
    systemd
    thinkfan

    # desktop applications
    onepassword
  ];

  homeModules = with self.homeModules; [
    # settings
    git
    ssh
    gtk
    fonts
    displays

    # desktop applications, etc
    foot
    gram
    gimp
    bruno
    krita
    slack
    signal
    spotify
    neovide
    ghostty
    obsidian
    chromium
    qalculate
    librewolf
    protonmail
    door-knocker
    microsoft-edge
    microsoft-teams

    # command line tools, etc
    gh
    uv
    fd
    sd
    jq
    bat
    eza
    vim
    k8s
    act
    fzf
    zmx
    fish
    bash
    just
    mise
    yazi
    btop
    tldr
    dive
    doxx
    dust
    atuin
    sqlit
    delta
    xleak
    zoxide
    neovim
    zellij
    direnv
    devenv
    diffnav
    lazygit
    ripgrep
    gh-dash
    vi-mongo
    starship
    fastfetch
    television
    lazyjournal
    systemctl-tui
    spotify-player

    # custom packages
    # electron-im
    windows
    # woverview
  ];
in
{
  # nixos (system-manager) configuration
  flake.nixosModules.system-configuration = { pkgs, ... }: {
    imports = nixosModules;

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

    system.autoUpgrade = {
      enable = false;
    };

    system-manager = {
      linkCurrentSystem = true;
    };

    services.userborn = {
      enable = lib.mkForce true;
      importLegacyState = true;
      static = false;
    };

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

    home-manager.users."thomas" = self.homeModules.home-configuration;
  };

  # home(-manager) configuration
  flake.homeModules.home-configuration = {
    imports = homeModules;

    home = {
      username = "thomas";
      homeDirectory = "/home/thomas";
      stateVersion = "26.11";
      sessionPath = [ "$HOME/.local/bin" ];
      sessionVariables = { };
    };

    programs.man.generateCaches = false;
  };

  # system manager config(s)
  flake.systemConfigs.default = inputs.system-manager.lib.makeSystemConfig {
    modules = [ self.nixosModules.system-configuration ];
  };

  flake.systemConfigs.x86_64-linux.systemConfigs.default = self.systemConfigs.default;
}
