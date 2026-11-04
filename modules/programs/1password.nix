{
  flake.nixosModules.onepassword = { pkgs, ... }: {
    environment.etc."1password/custom_allowed_browsers".text = ''
      microsoft-edge
      microsoft-edge-stable
      librewolf
    '';

    environment.etc."apparmor.d/nix-1password".text = ''
      abi <abi/4.0>,
      include <tunables/global>

      profile nix-1password /nix/store/**/bin/1password flags=(unconfined) {
        userns,
      }
    '';

    home-manager.sharedModules = [
      {
        home.packages = [ pkgs._1password-gui ];
        programs.ssh.settings."*".IdentityAgent = "~/.1password/agent.sock";
      }
    ];
  };

}
