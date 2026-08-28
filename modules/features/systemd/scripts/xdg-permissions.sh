
# script to fix multiple xdg directory permissions: icons, applications, etc

if [[ "$1" == "" ]]; then
    echo "usage: icon-permissions.sh <username>"
    exit 1
fi

chmod -R 755 "/etc/profiles/per-user/$1/share" # icons, pixmaps, applications, etc
chmod -R 755 "/home/$1/.local/share/icons"
# chmod -R 755 "/home/$1/.nix-profile/share/icons"
