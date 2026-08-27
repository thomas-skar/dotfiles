{
  flake.homeModules.fish = {
    programs.fish = {
      enable = true;
      generateCompletions = true;
      preferAbbrs = true;
      shellAbbrs = {
        # cd -> zoxide
        cd = "z";
        # ls -> eza
        ls = "eza -l";
        lsa = "eza -la";
        lsd = "eza -loa --no-permissions --total-size --smart-group";
        # cat -> bat
        cat = "bat --paging=never";
        # find -> fd
        find = "fd";
        # git
        gs = "git status -sb";
        gl = "git --no-pager log --oneline -n 20";
        glog = "git log --oneline";
        gif = "git --no-pager diff";
        gifs = "git --no-pager diff --staged";
        gb = "git --no-pager branch";
        gbd = "git branch -D";
        grv = "git remote -v";
        gfp = "git fetch --prune";
        add = "git add";
        adda = "git add --all";
        cmt = "git commit -m";
        pull = "git pull";
        push = "git push";
        amend = "git commit --amend";
        checkout = "git switch";
        co = "git switch";
        gco = "git switch";
        discard = "git restore";
        # github cli
        github = "gh";
        # lazygit
        lg = "lazygit";
        # just
        j = "just";
        jg = "just --global-justfile";
        sms = "just --global-justfile switch";
        # fastfetch
        ff = "fastfetch";
        # helix
        helix = "hx";
        # zed
        zed = "zeditor";
        # podman
        pps = "podman ps -a";
        ppsw = "podman ps -a -w 1";
        pprmaf = "podman pod rm --all --force";
        # oc
        noctx = "oc config unset current-context";
        # functions
        ghrip = "ghr intility procurement";
      };
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

        if test -d /run/wrappers/bin
          fish_add_path /run/wrappers/bin
        end

        if test -d /run/system-manager/sw/share
          set -gxp XDG_DATA_DIRS /run/system-manager/sw/share
        end

        if test -d /etc/profiles/per-user/$USER/share
          set -gxp XDG_DATA_DIRS /etc/profiles/per-user/$USER/share
        end

        if test -d /usr/share/glib-2.0/schemas
          set -gxa XDG_DATA_DIRS /usr/share/glib-2.0/schemas
        end

        if test -d /home/$USER/.local/share
          set -gxa XDG_DATA_DIRS /home/$USER/.local/share
        end
      '';
    };

    home.file.".config/fish/functions/ghr.fish".source = ./functions/ghr.fish;
    home.file.".config/fish/functions/gbn.fish".source = ./functions/gbn.fish;
    home.file.".config/fish/functions/prms.fish".source = ./functions/prms.fish;
    home.file.".config/fish/functions/whoami.fish".source = ./functions/whoami.fish;
    home.file.".config/fish/functions/desktop.fish".source = ./functions/desktop.fish;

  };
}
