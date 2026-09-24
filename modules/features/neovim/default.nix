{ self, ... }:
{
  flake.nixosModules.neovim = {
    home-manager.sharedModules = [
      self.homeModules.neovim
      self.homeModules.neovide
    ];
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
        pkgs.gotools
        pkgs.basedpyright
        pkgs.vscode-json-languageserver
        pkgs.yaml-language-server
        pkgs.sqls
        pkgs.bash-language-server
        pkgs.marksman
        pkgs.helm-ls
        pkgs.tombi
        pkgs.jsonnet-language-server
        pkgs.ansible-language-server
        pkgs.tailwindcss-language-server
        pkgs.vscode-css-languageserver
        pkgs.terraform-ls
        pkgs.terraform-lsp
        pkgs.htmx-lsp
        pkgs.postgres-language-server
        pkgs.typescript-language-server
        pkgs.dockerfile-language-server
        pkgs.ty
        pkgs.vscode-langservers-extracted
        pkgs.docker-language-server
        pkgs.htmx-lsp2
        pkgs.cmake-language-server
        # command line tools
        pkgs.jq
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

    home.file.".config/nvim/plugin".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/neovim/plugin";

    home.file.".config/nvim/after".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/dotfiles/modules/features/neovim/after";

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

  flake.homeModules.neovide = {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
        tabs = true;
        font = {
          normal = [ "JetBrainsMono Nerd Font" ];
          size = 12.0;
        };
      };
    };

    programs.fish.shellAbbrs = {
      neo = "neovide";
    };

    xdg.desktopEntries.neovide = {
      name = "Neovide";
      icon = "neovim";
      type = "Application";
      exec = "neovide %F";
      categories = [
        "Utility"
        "TextEditor"
      ];
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      startupNotify = true;
      settings = {
        StartupWMClass = "neovide";
      };
    };
  };
}
