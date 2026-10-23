
# activate python venv
function activate
    if ! test -d "./.venv"
        return 1
    end

    if ! test -d "./.venv/bin"
        return 1
    end

    if ! test -f "./.venv/bin/activate.fish"
        return 1
    end

    source "./.venv/bin/activate.fish"

    return 0
end
