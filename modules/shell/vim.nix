{
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
