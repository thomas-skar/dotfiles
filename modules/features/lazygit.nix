{ self, ... }:
{
  flake.nixosModules.lazygit = {
    home-manager.sharedModules = [ self.homeModules.lazygit ];
  };

  flake.homeModules.lazygit = {
    programs.lazygit = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        gui.language = "en";
        gui.showRandomTip = false;
        gui.nerdFontsVersion = "3";
        git.autoFetch = false;
        update.method = "never";
        confirmOnQuit = false;
        quitOnTopLevelReturn = true;
        disableStartupPopups = true;
        notARepository = "quit";
      };
    };

    programs.fish.shellAbbrs = {
      lg = "lazygit";
    };
  };
}
