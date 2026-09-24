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
        pkgs.ty
        pkgs.nil
        pkgs.nixd
        pkgs.ruff
        pkgs.gopls
        pkgs.taplo
        pkgs.tombi
        pkgs.oxfmt
        pkgs.oxlint
        pkgs.nixfmt
        pkgs.stylua
        pkgs.just-lsp
        pkgs.marksman
        pkgs.alejandra
        pkgs.typescript_7
        pkgs.basedpyright
        pkgs.lua-language-server
        pkgs.yaml-language-server
        pkgs.docker-language-server
        pkgs.jsonnet-language-server
        pkgs.golangci-lint-langserver
        pkgs.typescript-language-server
        pkgs.tailwindcss-language-server
        pkgs.graphql-language-service-cli

        pkgs.vscode-css-languageserver
        pkgs.vscode-html-languageserver
        pkgs.vscode-json-languageserver
        pkgs.vscode-langservers-extracted

        # command line tools, etc
        pkgs.jq
        pkgs.fzf
        pkgs.ripgrep
        pkgs.gotools
        pkgs.tree-sitter
        pkgs.golangci-lint

        # dependencies
        pkgs.gcc
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
