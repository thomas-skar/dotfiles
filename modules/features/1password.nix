{ self, ... }:
{
  # nixos + home manager module
  flake.modules.generic."1password" = {
    imports = [ self.modules.nixos."1password" ];
    home-manager.sharedModules = [ self.modules.homeManager."1password" ];
  };

  flake.modules.nixos."1password" = {
    environment.etc."1password/custom_allowed_browsers".text = ''
      microsoft-edge
      microsoft-edge-stable
      librewolf
    '';
  };

  flake.modules.homeManager."1password" = { pkgs, ... }: {
    home.packages = [ pkgs._1password-gui ];
    # TODO: if ssh is enabled
    programs.ssh.settings."*".IdentityAgent = "~/.1password/agent.sock";
  };
}
