# github pull request(s)
function ghpr -a action
    if ! command -v gh >/dev/null
        echo "gh is not installed"
        return 1
    end

    if ! command -v fzf >/dev/null
        echo "fzf is not installed"
        return 1
    end

    if ! command -v git >/dev/null
        echo "git is not installed"
        return 1
    end

    if ! git rev-parse --is-inside-work-tree &>/dev/null
        echo "fatal: not a git repository"
        return 1
    end

    if not contains $action close merge squash
        echo "invalid action: $action"
        return 1
    end

    set -f prs (gh pr list --json number,title,headRefName --template '{{range .}}{{tablerow .number .title .headRefName}}{{end}}' | fzf --reverse --multi --accept-nth=1)
    if not test -n "$prs"
        return 1
    end

    switch $action
        case close
            for pr in $prs
                gh pr close "$pr"
            end
        case merge
            for pr in $prs
                gh pr merge "$pr" --merge
            end
        case squash
            for pr in $prs
                gh pr merge "$pr" --squash
            end
    end

    return 0
end
