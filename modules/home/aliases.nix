{
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
}
