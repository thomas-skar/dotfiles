
# TODO:
# - cycle through windows of the same app (w/ title)?

if test -z "$1"; then
    echo "Usage: run-or-raise app_id [executable]"
    exit 1
fi

app_id=$1
executable=$2
test -z "$executable" && executable=$app_id

if ! wlrctl window focus "$app_id"; then
    $executable &
    disown
fi
