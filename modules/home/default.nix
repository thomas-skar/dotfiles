{ pkgs, ... }:
{
  imports = [
    ./labwc
    ./atuin.nix
    ./bash.nix
    ./chromium.nix
    ./displays.nix
    ./emacs.nix
    ./fish.nix
    ./git.nix
    ./librewolf.nix
    ./noctalia.nix
    ./obsidian.nix
    ./ssh.nix
    ./starship.nix
    ./teams.nix
    ./terminals.nix
    ./xdg.nix
    ./zed.nix
  ];

  home.packages = [
    # command line tools, etc
    pkgs.su
    pkgs.gh
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
    pkgs.dust
    pkgs.just
    pkgs.usage
    pkgs.tokei
    pkgs.wlrctl
    pkgs.shadow
    pkgs.sqlite
    pkgs.kubectl
    pkgs.kustomize
    pkgs.openshift
    # gui applications
    pkgs.bruno
    pkgs.slack
    pkgs.spotify
    pkgs.pcmanfm
    pkgs.localsend
    pkgs._1password-gui
    pkgs.jetbrains.goland
    pkgs.jetbrains.pycharm
    # miscellaneous
    pkgs.jetbrains-mono
    pkgs.gnome-themes-extra
    pkgs.whitesur-icon-theme

  ];
  home.stateVersion = "26.11";
  home.sessionPath = [ "$HOME/.local/bin" ];

  # command line tools, etc
  programs.home-manager.enable = true;
  programs.bat.enable = true;
  programs.btop.enable = true;
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
  programs.k9s.enable = true;
  programs.vim.enable = true;
  programs.neovim.enable = true;
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
  programs.ranger.enable = true;

  # services
  services.podman.enable = true; # TODO

  # theming
  gtk = {
    enable = true;

    theme.name = "Adwaita";
    iconTheme.name = "MacTahoe";
    cursorTheme.name = "Adwaita";

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
}
