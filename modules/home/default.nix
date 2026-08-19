{ pkgs, ... }:
let
  imports = [
    ./labwc
    ./atuin.nix
    ./displays.nix
    ./ghostty.nix
    ./git.nix
    ./noctalia.nix
    ./shells.nix
    ./ssh.nix
    ./starship.nix
  ];

  packages = [
    pkgs.gh
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
    pkgs.usage
    pkgs.just
    pkgs.wlrctl
    pkgs.kubectl
    pkgs.kustomize
    pkgs.openshift
    pkgs.bruno
    pkgs.slack
    pkgs.spotify
    pkgs._1password-gui
    pkgs.jetbrains.goland
    pkgs.jetbrains.pycharm
    pkgs.whitesur-icon-theme
    pkgs.gnome-themes-extra
    pkgs.teams-for-linux
  ];

in
{
  imports = imports;

  home.stateVersion = "26.11";
  home.packages = packages;
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

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
    globalConfig = { };
  };

  programs.direnv = {
    enable = false;
    mise.enable = true;
  };

  programs.foot.enable = true;

  programs.alacritty.enable = true;

  programs.zed-editor.enable = true; # TODO

  programs.chromium = {
    enable = true;
    package = pkgs.chromium; # TODO: ungoogled-chromium ?
  };

  programs.obsidian.enable = true;

  programs.fresh-editor.enable = false;

  services.podman.enable = true;

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
