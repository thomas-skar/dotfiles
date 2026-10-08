
function whoami
    /usr/bin/whoami

    if ! command -v git > /dev/null
        return 0
    end

    if ! git rev-parse --is-inside-work-tree &> /dev/null
        return 0
    end

    echo "$(git config user.name) ($(git config user.email))"

    return 0
end
