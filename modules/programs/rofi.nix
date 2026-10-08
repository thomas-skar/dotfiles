{ self, ... }:
{
  flake.nixosModules.rofi = {
    home-manager.sharedModules = [ self.homeModules.rofi ];
  };

  flake.homeModules.rofi = {
    programs.rofi = {
      enable = true;
      extraConfig = {
        modi = "run,drun";
        show-icons = true;
        drun-show-actions = false;
        drun-use-desktop-cache = false;
        drun-reload-desktop-cache = false;
        drun = {
          parse-user = true;
          parse-system = true;
        };
      };
      theme = "~/.config/rofi/noctalia.rasi";
    };
  };
}
