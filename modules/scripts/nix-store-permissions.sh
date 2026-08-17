# script to repair /nix/store permissions.

# files: 440 > 444
bad_files=$(find /nix/store -maxdepth 1 -type f -perm 440)
if [ "${#bad_files[@]}" -gt 0 ]; then
  for bad_file in "${bad_files[@]}"; do
      if [ "$bad_file" != "" ]; then
          chmod 444 $bad_file
      fi
  done
fi

# folders: 440 > 555
bad_folders=$(find /nix/store -maxdepth 1 -type d -perm 440)
if [ "${#bad_folders[@]}" -gt 0 ]; then
    for bad_folder in "${bad_folders[@]}"; do
        if [ "$bad_folder" != "" ]; then
            chmod 555 $bad_folder
        fi
    done
fi

exit 0
