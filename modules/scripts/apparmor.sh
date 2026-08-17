# script to register custom nix apparmor profiles

nix_apparmor_profiles=$(find /etc/apparmor.d/ -type l -name "nix-*")
if (( ${#nix_apparmor_profiles[@]} > 0 )); then
    for apparmor_profile in "${nix_apparmor_profiles[@]}"; do
        if [ "$apparmor_profile" != "" ]; then
            apparmor_parser --replace "$apparmor_profile"
        fi
    done
fi

exit 0
