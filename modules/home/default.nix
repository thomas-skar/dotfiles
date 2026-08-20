{ pkgs, ... }:
{
  imports = [
    ./labwc
    ./atuin.nix
    ./bash.nix
    ./cli.nix
    ./displays.nix
    ./emacs.nix
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
    pkgs.sqlite
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

  # default apps
  xdg = {
    enable = true;

    localBinInPath = true;

    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "microsoft-edge.desktop";
        "x-scheme-handler/http" = "microsoft-edge.desktop";
        "x-scheme-handler/https" = "microsoft-edge.desktop";
        "x-scheme-handler/about" = "microsoft-edge.desktop";
        "x-scheme-handler/unknown" = "microsoft-edge.desktop";
        "x-scheme-handler/mailto" = "microsoft-edge.desktop";
        "x-scheme-handler/slack" = "slack.desktop";
      };
    };

    desktopEntries = {
      "microsoft-edge" = {
        name = "Microsoft Edge";
        genericName = "Web Browser";
        type = "Application";
        icon = "microsoft-edge";
        exec = "/usr/bin/microsoft-edge-stable %U";
        categories = [
          "Network"
          "WebBrowser"
        ];
        mimeType = [
          "application/pdf"
          "application/rdf+xml"
          "application/rss+xml"
          "application/xhtml+xml"
          "application/xhtml_xml"
          "application/xml"
          "image/gif"
          "image/jpeg"
          "image/png"
          "image/webp"
          "text/html"
          "text/xml"
          "x-scheme-handler/http"
          "x-scheme-handler/https"
          "x-scheme-handler/microsoft-edge"
        ];
        startupNotify = true;
        terminal = false;
      };
    };
  };
}
