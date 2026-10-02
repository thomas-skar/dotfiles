
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
all: gram labwc neovim

# replace gram config file symlinks
gram:
    just --justfile symlink.just script ".config/gram/settings.jsonc" "modules/features/gram/settings.jsonc"
    just --justfile symlink.just script ".config/gram/keymap.jsonc" "modules/features/gram/keymap.jsonc"

# replace labwc config file symlinks
labwc:
    just --justfile symlink.just script ".config/labwc/rc.xml" "modules/features/labwc/rc.xml"
    just --justfile symlink.just script ".config/labwc/menu.xml" "modules/features/labwc/menu.xml"
    just --justfile symlink.just script ".local/share/themes/nix/labwc/themerc" "modules/features/labwc/themerc"

# replace neovim config file symlinks
neovim:
    just --justfile symlink.just script ".config/nvim/init.lua" "modules/features/neovim/init.lua"
    just --justfile symlink.just script ".config/nvim/plugin" "modules/features/neovim/plugin"
    just --justfile symlink.just script ".config/nvim/after" "modules/features/neovim/after"
