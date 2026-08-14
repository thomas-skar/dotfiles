{ pkgs, inputs, ... }:
let
  packages = [
    pkgs.nil
    pkgs.nixd
    pkgs.nixfmt
    pkgs.mise
    pkgs.just
    pkgs.wlrctl
    pkgs.kubectl
    pkgs.kustomize
    pkgs.bruno
    pkgs.slack
    pkgs.spotify
    pkgs.jetbrains.goland
    pkgs.jetbrains.pycharm
    pkgs.jetbrains.datagrip
  ];

  aliases = {
    # cd -> zoxide
    cd = "z";
    # ls -> eza
    ls = "eza -l";
    lsa = "eza -la";
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
  imports = [
    inputs.noctalia.homeModules.default
    ./ghostty.nix
    ./starship.nix
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

  programs.atuin.enable = true;

  programs.bat.enable = true;

  programs.btop.enable = true;

  programs.eza.enable = true;

  programs.fastfetch.enable = true;

  programs.fd.enable = true;

  programs.fzf = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = false;
  };

  programs.ripgrep.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
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

  programs.k9s.enable = true;

  programs.vim.enable = true;

  programs.foot.enable = true;

  programs.alacritty.enable = true;

  # TODO: config
  programs.zed-editor.enable = true;

  # TODO: config
  programs.noctalia.enable = true;
}
