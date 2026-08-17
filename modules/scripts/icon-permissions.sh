# script to fix icon directory permissions

if [[ "$1" != "" ]]; then
    username="$1"
else
    echo "usage: icon-permissions.sh <username> [uid] [gid]"
    exit 1
fi

user_id="1000"
if [[ "$2" != "" ]]; then
    user_id="$2"
fi

group_id="1000"
if [[ "$3" != "" ]]; then
    group_id="$3"
fi

chown -R $user_id:$group_id "/etc/profiles/per-user/$username/share/icons/hicolor"

# TODO: path to folder in /nix/store ?
# chown -R $user_id:$group_id "/home/$username/.nix-profile/share/icons/hicolor"
