# manage dependabot PRs
function dependabot -a action
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

    if not contains $action rebase recreate ignore-major ignore-minor ignore
        echo "invalid action: $action"
        return 1
    end

    set -f prs (gh pr list --author "app/dependabot" --state open --json number,title,headRefName --template '{{range .}}{{tablerow .number .title .headRefName}}{{end}}' | fzf --reverse --multi --accept-nth=1)
    if not test -n "$prs"
        return 1
    end

    switch $action
        case rebase
            set -f message "@dependabot rebase"
        case recreate
            set -f message "@dependabot recreate"
        case ignore-major
            set -f message "@dependabot ignore this major version"
        case ignore-minor
            set -f message "@dependabot ignore this minor version"
        case ignore
            set -f message "@dependabot ignore this dependency"
    end

    for pr in $prs
        gh pr comment "$pr" --body "$message"
    end

    return 0
end
