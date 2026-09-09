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
        # language servers, etc
        pkgs.nil
        pkgs.nixd
        pkgs.nixfmt
        pkgs.prettier
        pkgs.just-lsp
        pkgs.alejandra
        pkgs.lua-language-server
        pkgs.stylua
        pkgs.oxfmt
        pkgs.gopls
        pkgs.taplo
        pkgs.golangci-lint-langserver
        pkgs.copilot-language-server
        # command line tools
        pkgs.fzf
        pkgs.ripgrep
        pkgs.tree-sitter
        pkgs.golangci-lint
        # dependencies
        pkgs.gcc
        pkgs.gnumake # or cmake
        pkgs.rustc
        pkgs.cargo
      ];
      sideloadInitLua = true;
    };

    home.file.".config/nvim/init.lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/neovim/init.lua";

    home.file.".config/nvim/lua".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/neovim/lua";

    programs.fish.shellAbbrs = {
      v = "nvim";
      "v." = "nvim .";
      nv = "nvim";
      "nv." = "nvim .";
    };

    xdg.desktopEntries."nvim" = {
      name = "Neovim wrapper";
      noDisplay = true;
    };
  };
}
