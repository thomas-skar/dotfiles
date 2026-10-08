{
  flake.homeModules.ssh = {
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
