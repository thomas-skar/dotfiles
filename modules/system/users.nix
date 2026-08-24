{ username, ... }:
{
  services.userborn.enable = true;

  users.users."${username}" = {
    enable = true;
    isNormalUser = true;
    createHome = false;
    uid = 1000;
    group = username;
    extraGroups = [ ];
    home = "/home/${username}";
    homeMode = "700";
    shell = "/etc/profiles/per-user/${username}/bin/fish";
    useDefaultShell = true;
  };

  users.groups."${username}".gid = 1000;
}
