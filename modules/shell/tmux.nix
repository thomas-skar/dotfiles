{ self, ... }:
{
  flake.nixosModules.tmux = {
    home-manager.sharedModules = [ self.homeModules.tmux ];
  };

  flake.homeModules.tmux = {
    programs.tmux = {
      enable = true;
    };
  };
}
