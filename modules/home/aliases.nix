{
  # cd -> zoxide
  cd = "z";

  # ls -> eza
  ls = "eza -lo --no-permissions --total-size --smart-group";
  lsa = "eza -loa --no-permissions --total-size --smart-group";
  lsf = "eza -l";

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
}
