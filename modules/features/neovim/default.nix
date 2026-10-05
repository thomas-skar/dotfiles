{ self, ... }: {
  flake.nixosModules.neovim = {
    home-manager.sharedModules = [
      self.homeModules.neovim
      self.homeModules.neovide
    ];
  };

  flake.homeModules.neovim =
    {
      pkgs,
      ...
    }:
    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        extraPackages = [
          # language servers, formatters, etc
          pkgs.ty
          pkgs.nil
          pkgs.nixd
          pkgs.ruff
          pkgs.shfmt
          pkgs.gopls
          pkgs.taplo
          pkgs.tombi
          pkgs.oxfmt
          pkgs.oxlint
          pkgs.nixfmt
          pkgs.stylua
          pkgs.kdlfmt
          pkgs.just-lsp
          pkgs.marksman
          pkgs.prettierd
          pkgs.alejandra
          pkgs.codespell
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
          pkgs.xmlstarlet
          pkgs.tree-sitter
          pkgs.golangci-lint

          # dependencies
          pkgs.gcc
          pkgs.rustc
          pkgs.cargo
        ];
        sideloadInitLua = true;
      };

      xdg.configFile."nvim/init.lua" = {
        source = ./init.lua;
        force = true;
      };
      xdg.configFile."nvim/plugin" = {
        source = ./plugin;
        force = true;
      };
      xdg.configFile."nvim/after" = {
        source = ./after;
        force = true;
      };

      xdg.desktopEntries."nvim" = {
        name = "Neovim wrapper";
        noDisplay = true;
      };

      programs.fish.shellAbbrs = {
        v = "nvim";
        "v." = "nvim .";
      };
    };

  flake.homeModules.neovide = {
    programs.neovide = {
      enable = true;
      settings = {
        fork = true;
        frame = "none";
        maximized = false;
        idle = true;
        mouse-cursor-icon = "i-beam"; # arrow
        tabs = true;
        startup-message-capture = true;
        wayland-app-id = "neovide";

        font = {
          normal = [ "JetBrainsMono Nerd Font" ];
          size = 12.0;
          hinting = "full";
          edging = "antialias";
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
