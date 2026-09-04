{ self, ... }:
{
  flake.nixosModules.neovim = {
    home-manager.sharedModules = [ self.homeModules.neovim ];
  };

  flake.homeModules.neovim = { pkgs, ... }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = [
        pkgs.nil
        pkgs.nixd
        pkgs.nixfmt
        pkgs.fzf
        pkgs.ripgrep
      ];
    };
  };
}
