{ self, ... }:
{
  flake.nixosModules.ghostty = {
    home-manager.sharedModules = [ self.homeModules.ghostty ];
  };

  flake.homeModules.ghostty = {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true; # TODO if enabled
      systemd.enable = true;
      settings = {
        font-family = "JetBrains Mono";
        font-thicken = true;
        theme = "Monokai Pro";
        maximize = false;
        fullscreen = false;
        working-directory = "inherit"; # or home
        keybind = [
          "global:shift+ctrl+alt+super+period=toggle_quick_terminal"
          "global:shift+ctrl+alt+super+backquote=toggle_quick_terminal"
          "global:super+backquote=toggle_quick_terminal"
        ];
        key-remap = [ ];
        window-padding-x = 8;
        window-padding-y = 7;
        window-padding-balance = true;
        window-padding-color = "extend";
        window-inherit-working-directory = false;
        tab-inherit-working-directory = false;
        split-inherit-working-directory = true;
        window-decoration = "server"; # none/auto/client/server
        window-theme = "auto";
        window-new-tab-position = "end";
        window-show-tab-bar = "auto";
        focus-follows-mouse = true;
        copy-on-select = true;
        right-click-action = "context-menu";
        quick-terminal-position = "top";
        quick-terminal-size = "60%";
        gtk-quick-terminal-layer = "overlay";
        quick-terminal-autohide = false;
        quick-terminal-keyboard-interactivity = "on-demand";
        shell-integration = "detect";
        shell-integration-features = true;
        gtk-single-instance = "detect";
        gtk-titlebar = true;
        gtk-toolbar-style = "raised";
        gtk-titlebar-style = "native";
        gtk-wide-tabs = true;
        auto-update = "off";
        quit-after-last-window-closed = false;
      };
    };

  };
}
