{ pkgs, inputs, ... }:
let
  packages = with pkgs; [
    btop
    nil
    nixd
    mise
    just
    wlrctl
  ];

  aliases = {
    # ls
    ls = "ls -l";
    lsa = "ls -la";
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
  };
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.stateVersion = "26.11";
  home.packages = packages;
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.name = "Thomas Skar";
      user.email = "thomas.skar@intility.no";
      init.defaultBranch = "main";
    };
  };

  programs.lazygit.enable = true;

  programs.bash = {
    enable = true;
    package = pkgs.bashInteractive;
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
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        UserKnownHostsFile = "~/.ssh/known_hosts";
      };
      "Host github.com" = {
        HostName = "github.com";
        IdentityFile = "~/.ssh/github";
        IdentitiesOnly = true;
      };
    };
  };

  programs.ghostty.enable = true;

  programs.zed-editor.enable = true;

  programs.noctalia = {
    enable = true;
  };
}
