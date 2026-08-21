{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Thomas Skar";
      user.email = "thomas.skar@intility.no";
      init.defaultBranch = "main";
    };
  };

  programs.lazygit.enable = true;

  programs.jujutsu.enable = false;
}
