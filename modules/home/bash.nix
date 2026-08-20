let
  aliases = (import ./aliases.nix);
in
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      if [ -f "/etc/profile.d/system-manager-path.sh" ]; then
        source "/etc/profile.d/system-manager-path.sh"
      fi
    '';
    shellAliases = aliases;
  };
}
