{ self, ... }:
{
  flake.nixosModules.vim = {
    home-manager.sharedModules = [ self.homeModules.vim ];
  };

  flake.homeModules.vim = {
    programs.vim.enable = true;

    xdg.desktopEntries = {
      vim = {
        name = "Vim";
        noDisplay = true;
      };
      gvim = {
        name = "GVim";
        noDisplay = true;
      };
    };
  };
}
