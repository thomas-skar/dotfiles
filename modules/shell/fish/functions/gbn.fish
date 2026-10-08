
# git branch new
function gbn
    if ! command -v git > /dev/null
        echo "git is not available in path"
        return 1
    end

    if ! git rev-parse --is-inside-work-tree &> /dev/null
        echo "not a git repository"
        return 1
    end

    if test -d $argv[1]
        echo "branch name required"
        return 1
    end

    if test -d $argv[2]
        set -f remote "origin"
    else
        set -f remote $argv[2]
    end

    if test -n "$(git status --porcelain)"
        set -f dirty 1
        git stash save --include-untracked
    else
        set -f dirty 0
    end

    git switch --create $argv[1]

    git push -u $remote $argv[1]

    if test $dirty -eq 1
        git stash pop
    end

    return 0
end
