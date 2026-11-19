
[private]
default:
    @just --list --justfile symlink.just

[private]
script target source:
    #!/usr/bin/env fish
    if test -e "$HOME/{{ target }}"
      if test -L "$HOME/{{ target }}"
        rm "$HOME/{{ target }}"
        ln -s "$(pwd)/{{ source }}" "$HOME/{{ target }}"
      else if test -d "$HOME/{{ target }}"
        rm -r "$HOME/{{ target }}"
        ln -s "$(pwd)/{{ source }}" "$HOME/{{ target }}"
      end
    else
      ln -s "$(pwd)/{{ source }}" "$HOME/{{ target }}"
    end

# TODO: directory script? for each in directory, do ...

all: broot fish gram kitty labwc noctalia neovim yazi zellij

broot:
    just --justfile symlink.just script ".config/broot/conf.hjson" "modules/shell/broot/conf.hjson"
    just --justfile symlink.just script ".config/broot/verbs.hjson" "modules/shell/broot/verbs.hjson"

fish:
    just --justfile symlink.just script ".config/fish/functions" "modules/shell/fish/functions"

gram:
    just --justfile symlink.just script ".config/gram/settings.jsonc" "modules/programs/gram/settings.jsonc"
    just --justfile symlink.just script ".config/gram/keymap.jsonc" "modules/programs/gram/keymap.jsonc"

kitty:
    just --justfile symlink.just script ".config/kitty/kitty.conf" "modules/programs/kitty/kitty.conf"
    just --justfile symlink.just script ".config/kitty/quick-access-terminal.conf" "modules/programs/kitty/quick-access-terminal.conf"

labwc:
    just --justfile symlink.just script ".config/labwc/rc.xml" "modules/desktop/labwc/rc.xml"
    just --justfile symlink.just script ".config/labwc/menu.xml" "modules/desktop/labwc/menu.xml"
    just --justfile symlink.just script ".local/share/themes/nix/labwc/themerc" "modules/desktop/labwc/themerc"

neovim:
    just --justfile symlink.just script ".config/nvim/init.lua" "modules/shell/neovim/init.lua"
    just --justfile symlink.just script ".config/nvim/plugin" "modules/shell/neovim/plugin"
    just --justfile symlink.just script ".config/nvim/after" "modules/shell/neovim/after"

noctalia:
    just --justfile symlink.just script ".config/noctalia/config.toml" "modules/desktop/noctalia/config.toml"
    just --justfile symlink.just script ".config/noctalia/palettes/custom.json" "modules/desktop/noctalia/palette.json"

yazi:
    just --justfile symlink.just script ".config/yazi/yazi.toml" "modules/shell/yazi/yazi.toml"
    just --justfile symlink.just script ".config/yazi/theme.toml" "modules/shell/yazi/theme.toml"
    just --justfile symlink.just script ".config/yazi/keymap.toml" "modules/shell/yazi/keymap.toml"

zellij:
    just --justfile symlink.just script ".config/zellij/config.kdl" "modules/shell/zellij/config.kdl"
    just --justfile symlink.just script ".config/zellij/layouts/custom.kdl" "modules/shell/zellij/layout.kdl"
