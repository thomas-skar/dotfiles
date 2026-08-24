{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Thomas Skar";
      user.email = "thomas.skar@intility.no";
      init.defaultBranch = "main";
    };
  };

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

  programs.jujutsu.enable = false;
}
