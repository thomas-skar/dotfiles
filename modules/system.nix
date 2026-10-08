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
    bruno
    neovide
    ghostty
    obsidian
    chromium
    librewolf
    door-knocker
    microsoft-edge
    microsoft-teams
    # command line tools, etc
    uv
    fd
    bat
    eza
    vim
    k8s
    fish
    bash
    just
    mise
    yazi
    btop
    atuin
    sqlit
    delta
    zoxide
    neovim
    zellij
    direnv
    devenv
    lazygit
    ripgrep
    starship
    vi-mongo
    fastfetch
    television
    github-cli
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

  # TODO: move packages to separate modules

  # home(-manager) configuration
  flake.homeModules.home-configuration = { pkgs, ... }: {
    imports = homeModules;

    home = {
      username = "thomas";
      homeDirectory = "/home/thomas";
      stateVersion = "26.11";
      sessionPath = [ "$HOME/.local/bin" ];
      sessionVariables = { };
      packages = [
        # command line tools, etc
        pkgs.dust
        pkgs.tokei
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
        pkgs.qalculate-gtk
        pkgs.tangram
        # pkgs.nwg-look
        pkgs.protonmail-desktop
      ];
    };

    # TODO: move programs to separate modules
    programs.fzf = {
      enable = true;
      enableBashIntegration = false;
      enableFishIntegration = false;
    };
    programs.jq.enable = true;
    programs.parallel.enable = false;
    programs.ranger.enable = false;
    programs.man.generateCaches = false;

  };

  # system manager config(s)
  flake.systemConfigs.default = inputs.system-manager.lib.makeSystemConfig {
    modules = [ self.nixosModules.system-configuration ];
  };

  flake.systemConfigs.x86_64-linux.systemConfigs.default = self.systemConfigs.default;
}
