{ self, ... }:
{
  flake.nixosModules.helix = {
    home-manager.sharedModules = [ self.homeModules.helix ];
  };

  flake.homeModules.helix = {
    programs.helix = {
      enable = true;
      defaultEditor = false;
      languages = { };
      settings = {
        theme = "monokai_pro";
        editor = {
          mouse = true;
          line-number = "absolute";
          bufferline = "always";
          color-modes = true;
          trim-final-newlines = true;
          trim-trailing-whitespace = true;
          popup-border = "all";
          indent-guides.render = true;
        };
      };
    };

  };
}
