let
  abbreviations = (import ./aliases.nix);

  fishOnlyAbbrs = {
    ghrip = "ghr intility procurement";
  };
in
{
  programs.fish = {
    enable = true;
    generateCompletions = true;
    preferAbbrs = true;
    shellAbbrs = abbreviations // fishOnlyAbbrs;
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
        set -gx XDG_DATA_DIRS /run/system-manager/sw/share
      end

      if test -d /etc/profiles/per-user/$USER/share
        set -gx XDG_DATA_DIRS /etc/profiles/per-user/$USER/share
      end

      if test -d /run/wrappers/bin
        fish_add_path /run/wrappers/bin
      end
    '';
  };

  home.file.".config/fish/functions/ghr.fish".source = ../../scripts/ghr.fish;
  home.file.".config/fish/functions/prms.fish".source = ../../scripts/prms.fish;
  home.file.".config/fish/functions/whoami.fish".source = ../../scripts/whoami.fish;
}
