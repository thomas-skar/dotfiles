
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
      end
    else
      ln -s "$(pwd)/{{ source }}" "$HOME/{{ target }}"
    end

# replace all config file symlinks
all: gram labwc neovim zellij

# replace gram config file symlinks
gram:
    just --justfile symlink.just script ".config/gram/settings.jsonc" "modules/programs/gram/settings.jsonc"
    just --justfile symlink.just script ".config/gram/keymap.jsonc" "modules/programs/gram/keymap.jsonc"

# replace labwc config file symlinks
labwc:
    just --justfile symlink.just script ".config/labwc/rc.xml" "modules/desktop/labwc/rc.xml"
    just --justfile symlink.just script ".config/labwc/menu.xml" "modules/desktop/labwc/menu.xml"
    just --justfile symlink.just script ".local/share/themes/nix/labwc/themerc" "modules/desktop/labwc/themerc"

# replace neovim config file symlinks
neovim:
    just --justfile symlink.just script ".config/nvim/init.lua" "modules/shell/neovim/init.lua"
    just --justfile symlink.just script ".config/nvim/plugin" "modules/shell/neovim/plugin"
    just --justfile symlink.just script ".config/nvim/after" "modules/shell/neovim/after"

# replace zellij config file symlinks
zellij:
    just --justfile symlink.just script ".config/zellij/config.kdl" "modules/shell/zellij/config.kdl"
    just --justfile symlink.just script ".config/zellij/layouts/custom.kdl" "modules/shell/zellij/layout.kdl"
