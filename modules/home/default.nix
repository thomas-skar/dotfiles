{ pkgs, ... }:
{
  imports = [
    ./labwc
    ./atuin.nix
    ./bash.nix
    ./cli.nix
    ./displays.nix
    ./fish.nix
    ./ghostty.nix
    ./git.nix
    ./librewolf.nix
    ./noctalia.nix
    ./ssh.nix
    ./starship.nix
    ./teams.nix
    ./zed.nix
  ];

  home.packages = [
    pkgs.gh
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
    pkgs.dust
    pkgs.just
    pkgs.usage
    pkgs.tokei
    pkgs.kubectl
    pkgs.kustomize
    pkgs.openshift
    pkgs.wlrctl
    pkgs.bruno
    pkgs.slack
    pkgs.spotify
    pkgs._1password-gui
    pkgs.jetbrains.goland
    pkgs.jetbrains.pycharm
    pkgs.pcmanfm
    pkgs.whitesur-icon-theme
    pkgs.gnome-themes-extra
    pkgs.su
    pkgs.shadow
  ];
  home.stateVersion = "26.11";
  home.sessionPath = [ "$HOME/.local/bin" ];

  programs.home-manager.enable = true;

  programs.foot.enable = true;

  programs.alacritty.enable = true;

  programs.chromium = {
    enable = true;
    package = pkgs.chromium; # TODO: ungoogled-chromium ?

  };
  programs.obsidian.enable = true;

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
