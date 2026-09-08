{ self, ... }:
{
  flake.nixosModules.git = {
    home-manager.sharedModules = [ self.homeModules.git ];
  };

  flake.homeModules.git = {
    programs.git = {
      enable = true;
      # TODO: move to modules/system ?
      settings = {
        user.name = "Thomas Skar";
        user.email = "thomas.skar@intility.no";
        init.defaultBranch = "main";
      };
    };

    programs.fish.shellAbbrs = {
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
    };
  };
}
