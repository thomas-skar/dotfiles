{ pkgs, ... }:
{
  imports = [
    ./labwc
    ./noctalia
    ./atuin.nix
    ./bash.nix
    ./chromium.nix
    ./displays.nix
    ./fish.nix
    ./fonts.nix
    ./foot.nix
    ./ghostty.nix
    ./git.nix
    ./helix.nix
    ./just.nix
    ./k8s.nix
    ./librewolf.nix
    ./obsidian.nix
    ./ssh.nix
    ./starship.nix
    ./teams.nix
    ./xdg.nix
    ./zed.nix
  ];

  home.packages = [
    # command line tools, etc
    pkgs.gh
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
    pkgs.dust
    pkgs.usage
    pkgs.tokei
    pkgs.wlrctl
    pkgs.sqlite
    pkgs.systemctl-tui
    pkgs.systemd-manager-tui
    pkgs.thinkfan
    pkgs.nix-tree
    # gui applications
    pkgs.bruno
    pkgs.slack
    pkgs.spotify
    pkgs.pcmanfm
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

  # command line tools, etc
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
}
