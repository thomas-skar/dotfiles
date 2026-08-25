let
  abbreviations = (import ./aliases.nix);
in
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    preferAbbrs = true;
    shellAbbrs = abbreviations // {
      ghrip = "ghr intility procurement";
    };
    functions = { };
    interactiveShellInit = ''
      # Disable welcome message
      set -g fish_greeting
    '';
    loginShellInit = ''
      if test -d /run/system-manager/sw/bin
        fish_add_path /run/system-manager/sw/bin
      end

      if test -d /etc/profiles/per-user/$USER/bin
        fish_add_path /etc/profiles/per-user/$USER/bin
      end

      if test -d /run/system-manager/sw/share
        set -gxp XDG_DATA_DIRS /run/system-manager/sw/share
      end

      if test -d /etc/profiles/per-user/$USER/share
        set -gxp XDG_DATA_DIRS /etc/profiles/per-user/$USER/share
      end

      if test -d /run/wrappers/bin
        fish_add_path /run/wrappers/bin
      end

      if test -d /usr/share/glib-2.0/schemas
        set -gxp XDG_DATA_DIRS /usr/share/glib-2.0/schemas
      end

      if test -d /home/$USER/.local/share
        set -gxa XDG_DATA_DIRS /home/$USER/.local/share
      end
    '';
  };

  home.file.".config/fish/functions/ghr.fish".source = ../../scripts/ghr.fish;
  home.file.".config/fish/functions/prms.fish".source = ../../scripts/prms.fish;
  home.file.".config/fish/functions/whoami.fish".source = ../../scripts/whoami.fish;
}
