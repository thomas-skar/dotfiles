let
  aliases = {
    # cd -> zoxide
    cd = "z";
    # ls -> eza
    ls = "eza -lo --no-permissions --total-size --smart-group";
    lsa = "eza -loa --no-permissions --total-size --smart-group";
    # cat -> bat
    cat = "bat --paging=never";
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
    discard = "git restore";
    # lazygit
    lg = "lazygit";
    # just
    j = "just";
    # fastfetch
    ff = "fastfetch";
    # zed
    zed = "zeditor";
  };
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

  programs.fish = {
    enable = true;
    generateCompletions = true;
    preferAbbrs = true;
    shellAbbrs = aliases;
    functions = { };
    interactiveShellInit = ''
      # Disable welcome message
      set -g fish_greeting
    '';
    loginShellInit = ''
      if test -L /etc/profile.d/system-manager-path.sh; and test -e /etc/profile.d/system-manager-path.sh
        source /etc/profile.d/system-manager-path.sh
      end
    '';
  };

  home.file.".config/fish/functions/prms.fish".source = ../../scripts/prms.fish;
  home.file.".config/fish/functions/whoami.fish".source = ../../scripts/whoami.fish;
}
