{ self, ... }:
{
  flake.nixosModules.neovim = {
    home-manager.sharedModules = [ self.homeModules.neovim ];
  };

  flake.homeModules.neovim = { pkgs, config, ... }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = [
        pkgs.nil
        pkgs.nixd
        pkgs.nixfmt
        pkgs.prettier
        pkgs.just-lsp
        pkgs.alejandra
        pkgs.lua-language-server
        pkgs.stylua
        pkgs.oxfmt
        pkgs.fzf
        pkgs.ripgrep
        pkgs.gcc
        pkgs.gnumake # or cmake
      ];
      sideloadInitLua = true;
    };

    home.file.".config/nvim/init.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/neovim/init.lua";
  };
}
