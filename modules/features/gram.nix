# DOCS: https://gram-editor.com/docs/configuring-gram/
{ self, ... }:
{
  flake.nixosModules.gram = {
    home-manager.sharedModules = [ self.homeModules.gram ];
  };

  flake.homeModules.gram = { pkgs, ... }: {
    programs.gram = {
      enable = true;
      extraPackages = [
        # language servers, formatters, etc
        pkgs.nil
        pkgs.nixd
        pkgs.nixfmt
        pkgs.taplo
        pkgs.tombi
        pkgs.oxfmt
        pkgs.stylua
        pkgs.just-lsp
        pkgs.alejandra
        pkgs.prettierd
        pkgs.xmlstarlet
        pkgs.lua-language-server
        pkgs.yaml-language-server
        pkgs.vscode-langservers-extracted
        # dependencies
        pkgs.gcc
        pkgs.rustc
        pkgs.cargo
      ];
      settings = {
        theme = "Zedokai Darker";
        auto_indent = true;
        auto_indent_on_paste = true;
        autosave = "on_focus_change";
        auto_signature_help = true;
        base_keymap = "VSCode";
        buffer_font_family = "JetBrains Mono";
        buffer_font_size = 14;
        confirm_quit = false;
        load_direnv = "shell_hook";
        current_line_highlight = "all";
        rounded_selection = true;
        cursor_blink = true;
        cursor_shape = "bar";
        tab_bar = {
          show = true;
        };
        tabs = {
          file_icons = true;
        };
        inline_code_actions = true;
        enable_language_server = true;
        ensure_final_newline_on_save = true;
        status_bar = {
          show = true;
        };
        lsp = { };
        global_lsp_settings = { };
        format_on_save = "on";
      };
    };

    xdg.desktopEntries."app.liten.Gram" = {
      type = "Application";
      name = "Gram";
      exec = "gram %U";
      icon = "zed"; # <--
      categories = [
        "Development"
        "TextEditor"
        "IDE"
      ];
      mimeType = [
        "text/plain"
        "application/x-zerosize"
        "x-scheme-handler/gram"
      ];
      startupNotify = true;
      settings = {
        StartupWMClass = "app.liten.Gram";
      };
    };
  };
}
