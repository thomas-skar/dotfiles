{
  flake.homeModules.fish = {
    programs.fish = {
      enable = true;
      generateCompletions = true;
      preferAbbrs = true;
      shellAbbrs = {
        # ls
        ls = "ls -l";
        lsa = "ls -la";
        # pnpm
        pn = "pnpm";
        # functions
        ghrip = "ghr intility procurement";
      };
      shellInit = ''
        # disable welcome message
        set -g fish_greeting

        # fix paths
        if test -d /run/system-manager/sw/bin
          fish_add_path /run/system-manager/sw/bin
        end

        if test -d /etc/profiles/per-user/$USER/bin
          fish_add_path /etc/profiles/per-user/$USER/bin
        end

        if test -d /run/wrappers/bin
          fish_add_path /run/wrappers/bin
        end

        if test -d /run/system-manager/sw/share
          set -gx XDG_DATA_DIRS "/run/system-manager/sw/share:$XDG_DATA_DIRS"
        end

        if test -d /etc/profiles/per-user/$USER/share
          set -gx XDG_DATA_DIRS "/etc/profiles/per-user/$USER/share:$XDG_DATA_DIRS"
        end

        if test -d /usr/share/glib-2.0/schemas
          set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:/usr/share/glib-2.0/schemas"
        end

        if test -d /home/$USER/.local/share
          set -gx XDG_DATA_DIRS "$XDG_DATA_DIRS:/home/$USER/.local/share"
        end

        # override command-not-found
        function fish_command_not_found
            __fish_default_command_not_found_handler $argv
        end
      '';
      shellInitLast = "";
      loginShellInit = "";
      interactiveShellInit = "";
    };

    # TODO: symlink directory instead of files?
    home.file.".config/fish/functions" = {
      source = ./functions;
      recursive = true;
    };
  };
}
