{
  flake.homeModules.ssh = {

    # TODO: move to modules/system ?
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "*" = {
          UserKnownHostsFile = "~/.ssh/known_hosts";
          IdentityAgent = "~/.1password/agent.sock";
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
