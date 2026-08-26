
# github repo
function ghr --argument-names owner topic
    if ! command -v gh > /dev/null
        echo "gh is not installed"
        return 1
    end

    if ! command -v fzf > /dev/null
        echo "fzf is not installed"
        return 1
    end

    if test (gh auth status --json hosts --jq '.hosts.["github.com"][0].state') != "success"
        echo "you're not logged in"
        return 1
    end

    set -f repos (gh repo list "$owner" --topic "$topic" --json url --jq '.[].url' --limit 100)

    set -f url (for url in $repos; echo $url; end | fzf)

    if test -n "$url"
        open "$url"
        return 0
    end

    return 1
end
