
# launch .desktop items
function desktop -a name
    if ! command -v fd >/dev/null
        echo "fd is not available in path"
        return 1
    end

    if ! command -v fzf >/dev/null
        echo "fzf is not available in path"
        return 1
    end

    if ! command -v gio >/dev/null
        echo "gio is not available in path"
        return 1
    end

    set -f item (fd --absolute-path --extension desktop --exclude /nix/store --base-directory / | fzf --query="$name" --select-1)

    if test -n "$item"
        gio launch "$item"
        return 0
    end

    return 1
end
