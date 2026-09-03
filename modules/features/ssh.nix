{ self, ... }:
{
  flake.nixosModules.ssh = {
    home-manager.sharedModules = [ self.homeModules.ssh ];
  };

  flake.homeModules.ssh = {
    # TODO: move to modules/system ?
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "*" = {
          UserKnownHostsFile = "~/.ssh/known_hosts";
        };
        "Host github.com" = {
          HostName = "github.com";
          IdentityFile = "~/.ssh/github";
          IdentitiesOnly = true;
        };
      };
    };

  };
}
