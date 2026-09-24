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
    programs.fish.shellAbbrs = {
      cat = "bat --paging=never";
    };
  };

  flake.nixosModules.eza = {
    home-manager.sharedModules = [ self.homeModules.eza ];
  };
  flake.homeModules.eza = { lib, ... }: {
    programs.eza.enable = true;
    programs.fish.shellAbbrs = {
      ls = lib.mkForce "eza -l";
      lsa = lib.mkForce "eza -la";
      lsd = "eza -loa --no-permissions --total-size --smart-group";

    };
  };

  flake.nixosModules.fd = {
    home-manager.sharedModules = [ self.homeModules.fd ];
  };
  flake.homeModules.fd = {
    programs.fd.enable = true;
    programs.fish.shellAbbrs = {
      find = "fd";
    };
  };

  flake.nixosModules.ripgrep = {
    home-manager.sharedModules = [ self.homeModules.ripgrep ];
  };
  flake.homeModules.ripgrep = {
    programs.ripgrep.enable = true;
    programs.ripgrep-all.enable = true;
    programs.fish.shellAbbrs = {
      cat = "bat --paging=never";
    };
  };

  flake.nixosModules.zoxide = {
    home-manager.sharedModules = [ self.homeModules.zoxide ];
  };
  flake.homeModules.zoxide = {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.fish.shellAbbrs = {
      cd = "z";
    };
  };

}
