{
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
          pkgs.yamlfmt
          pkgs.yamllint
          pkgs.just-lsp
          pkgs.fish-lsp
          pkgs.marksman
          pkgs.prettierd
          pkgs.alejandra
          pkgs.codespell
          pkgs.typescript_7
          pkgs.basedpyright
          pkgs.yaml-schema-router
          pkgs.lua-language-server
          pkgs.yaml-language-server
          pkgs.bash-language-server
          pkgs.docker-language-server
          pkgs.jsonnet-language-server
          pkgs.golangci-lint-langserver
          pkgs.tailwindcss-language-server
          pkgs.graphql-language-service-cli
          pkgs.vscode-langservers-extracted
          # pkgs.typescript-language-server

          # command line tools, etc
          pkgs.jq
          pkgs.fzf
          pkgs.tilt
          pkgs.ripgrep
          pkgs.gotools
          pkgs.ast-grep
          pkgs.shellcheck
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
}
