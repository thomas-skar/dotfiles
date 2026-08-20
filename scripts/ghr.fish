
# github repo
function ghr
    if ! command -v gh > /dev/null
        echo "gh is not installed"
        return 1
    end

    if ! command -v fzf > /dev/null
        echo "fzf is not installed"
        return 1
    end

    # TODO: check gh login status ?
    # TODO: list repos
end
