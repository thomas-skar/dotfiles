{ self, ... }:
{
  flake.nixosModules.git = {
    home-manager.sharedModules = [ self.homeModules.git ];
  };

  flake.homeModules.git = {
    programs.git = {
      enable = true;

      # TODO: move to modules/system ?
      settings = {
        user.name = "Thomas Skar";
        user.email = "thomas.skar@intility.no";
        init.defaultBranch = "main";
      };
    };

    # TODO: separate homeModule
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

  };
}
