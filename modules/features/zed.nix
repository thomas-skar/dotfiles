{ self, ... }:
{
  flake.nixosModules.zed = {
    home-manager.sharedModules = [ self.homeModules.zed ];
  };

  flake.homeModules.zed = { pkgs, ... }: {
    programs.zed-editor = {
      enable = true;
      installRemoteServer = false;
      defaultEditor = true;

      extraPackages = [
        pkgs.nil
        pkgs.nixd
        pkgs.nixfmt
        pkgs.prettier
        pkgs.just-lsp
        pkgs.alejandra
      ];

      extensions = [
        "nix"
        "just"
        "monokai-pro-ce"
        "html"
        "toml"
        "xml"
        "fish"
      ];

      mutableUserSettings = true;
      userSettings = {
        theme = "Monokai Pro (CE)";
        buffer_font_family = "JetBrains Mono";
        buffer_font_size = 15;
        ui_font_size = 16;
        base_keymap = "VSCode";
        colorize_brackets = true;
        vim_mode = false;
        indent_guides.enabled = true;
        ensure_final_newline_on_save = true;
        remove_trailing_whitespace_on_save = true;
        format_on_save = "on";
        formatter = "auto";
        close_on_file_delete = true;
        telemetry = {
          diagnostics = false;
          metrics = false;
          anthropic_retention = false;
        };
        window_decorations = "server";
        which_key.enabled = true;
        autosave = "on_focus_change";
        auto_update = false;
        session.trust_all_worktrees = true;

        tabs = {
          show_close_button = "always";
          file_icons = true;
          # show_branch_status_icon = true;
        };
        status_bar = {
          show_active_file = true;
          line_endings_button = true;
        };
        gutter = {
          breakpoints = false;
        };
        project_panel = {
          git_status_indicator = true;
          diagnostic_badges = true;
          bold_folder_labels = true;
          indent_size = 12;
          button = true;
          dock = "left";
        };

        semantic_tokens = "combined";
        code_lens = "menu";
        prettier.allowed = true;
        enable_language_server = true;
        inlay_hints = {
          enabled = true;
          show_background = true;
        };
        languages = {
          "XML" = {
            tab_size = 2;
          };
          "Nix" = {
            language_servers = [
              "nixd"
              "nil"
            ];
            formatter.external = {
              command = "nixfmt";
              arguments = [
                "--quiet"
                "--"
              ];
            };
          };
        };
        lsp = {
          "nixd" = {
            formatting.command = [ "nixfmt" ];
          };
          "nil" = {
            formatting.command = [ "nixfmt" ];
            nix.binary = "/run/system-manager/sw/bin/nix";
            nix.flake.autoArchive = true;
            nix.flake.autoEvalInputs = true;
            nix.flake.nixpkgsInputName = "nixpkgs";
          };
        };
        edit_predictions = {
          provider = "copilot";
          allow_data_collection = "no";
        };
      };

      mutableUserKeymaps = true;
      userKeymaps = [
        {
          context = "Editor";
          bindings = {
            alt-left = "editor::MoveToPreviousWordStart";
            alt-right = "editor::MoveToNextWordEnd";
            super-left = "editor::MoveToBeginningOfLine";
            super-right = "editor::MoveToEndOfLine";
            super-up = "editor::MoveToBeginning";
            super-down = "editor::MoveToEnd";
            alt-backspace = "editor::DeleteToPreviousWordStart";
            super-backspace = "editor::DeleteToBeginningOfLine";
            shift-super-backspace = "editor::DeleteToEndOfLine";
          };
        }
      ];
    };

  };
}
