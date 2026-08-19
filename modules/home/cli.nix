{
  programs.bat.enable = true;

  programs.btop.enable = true;

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

  programs.k9s.enable = true;

  programs.vim.enable = true;

  programs.neovim.enable = true;

  programs.yazi.enable = true;

  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    globalConfig = { };
  };

  programs.direnv = {
    enable = false;
    mise.enable = true;
  };

  programs.fresh-editor.enable = false;

}
