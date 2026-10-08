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
        pkgs.lemminx
        pkgs.just-lsp
        pkgs.fish-lsp
        pkgs.prettier
        pkgs.prettierd
        pkgs.alejandra
        pkgs.xmlstarlet
        pkgs.shellcheck
        pkgs.lua-language-server
        pkgs.yaml-language-server
        pkgs.bash-language-server
        pkgs.vscode-langservers-extracted
        # dependencies
        pkgs.gcc
        pkgs.rustc
        pkgs.cargo
        pkgs.rustup
      ];
    };

    home.file.".config/gram/settings.jsonc".source = ./settings.jsonc;
    home.file.".config/gram/keymap.jsonc".source = ./keymap.jsonc;

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
