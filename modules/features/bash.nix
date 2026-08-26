{
  flake.homeModules.bash = {
    programs.bash = {
      enable = true;
      bashrcExtra = ''
        if [ -f "/etc/profile.d/system-manager-path.sh" ]; then
          source "/etc/profile.d/system-manager-path.sh"
        fi
      '';
      shellAliases = { }; # TODO: ?
    };
  };
}
