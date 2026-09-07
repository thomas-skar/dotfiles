{ self, ... }:
{
  flake.nixosModules.shell = {
    imports = [
      self.nixosModules.bat
      self.nixosModules.eza
      self.nixosModules.fd
      self.nixosModules.ripgrep
      self.nixosModules.zoxide
    ];
  };

  flake.nixosModules.bat = {
    home-manager.sharedModules = [ self.homeModules.bat ];
  };
  flake.homeModules.bat = {
    programs.bat.enable = true;
  };

  flake.nixosModules.eza = {
    home-manager.sharedModules = [ self.homeModules.eza ];
  };
  flake.homeModules.eza = {
    programs.eza.enable = true;
  };

  flake.nixosModules.fd = {
    home-manager.sharedModules = [ self.homeModules.fd ];
  };
  flake.homeModules.fd = {
    programs.fd.enable = true;
  };

  flake.nixosModules.ripgrep = {
    home-manager.sharedModules = [ self.homeModules.ripgrep ];
  };
  flake.homeModules.ripgrep = {
    programs.ripgrep.enable = true;
  };

  flake.nixosModules.zoxide = {
    home-manager.sharedModules = [ self.homeModules.zoxide ];
  };
  flake.homeModules.zoxide = {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

}
