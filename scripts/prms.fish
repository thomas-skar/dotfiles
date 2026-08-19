
# pull request squash merge
function prms
    if ! command -v gh > /dev/null
        echo "gh is not installed"
        return 1
    end

    if ! command -v fzf > /dev/null
        echo "fzf is not installed"
        return 1
    end

    if ! command -v git > /dev/null
        echo "git is not installed"
        return 1
    end

    if ! git rev-parse --is-inside-work-tree &> /dev/null
        echo "fatal: not a git repository"
        return 1
    end

    set -f prs (gh pr list --json number,title,headRefName,labels --template '{{range .}}{{tablerow .number .title .headRefName}}{{end}}' | fzf --reverse --multi --accept-nth=1)
    if not test -n "$prs"
        return 1
    end

    for pr in $prs
        gh pr merge "$pr" --squash
    end

    return 0
end
