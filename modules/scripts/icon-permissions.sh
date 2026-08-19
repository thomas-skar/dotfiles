# script to fix icon directory permissions

if [[ "$1" == "" ]]; then
    echo "usage: icon-permissions.sh <username>"
    exit 1
fi

chmod -R 755 "/etc/profiles/per-user/$1/share/icons"
chmod -R 755 "/etc/profiles/per-user/$1/share/pixmaps"
chmod -R 755 "/home/$1/.local/share/icons"

# TODO ?
# gtk-update-icon-cache
