{ self, ... }:
{
  flake.nixosModules.onepassword = {
    environment.etc."1password/custom_allowed_browsers".text = ''
      microsoft-edge
      microsoft-edge-stable
      librewolf
    '';

    home-manager.sharedModules = [ self.homeModules.onepassword ];
  };

  flake.homeModules.onepassword = { pkgs, ... }: {
    home.packages = [ pkgs._1password-gui ];
    programs.ssh.settings."*".IdentityAgent = "~/.1password/agent.sock";
  };
}
