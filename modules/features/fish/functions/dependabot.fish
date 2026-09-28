# manage dependabot PRs
function dependabot
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

    set -f prs (gh pr list --author "app/dependabot" --state open --json number,title,headRefName --template '{{range .}}{{tablerow .number .title .headRefName}}{{end}}' | fzf --reverse --multi --accept-nth=1)
    if not test -n "$prs"
        return 1
    end

    # TODO: implement more dependabot actions
    for pr in $prs
        gh pr comment "$pr" --body "@dependabot rebase"
    end

    return 0
end
