{
  services.userborn.enable = true;

  users.users.thomas = {
    enable = true;
    isNormalUser = true;
    createHome = false;
    uid = 1000;
    group = "thomas";
    extraGroups = [ ];
    home = "/home/thomas";
    homeMode = "700";
    shell = "/etc/profiles/per-user/thomas/bin/fish";
    useDefaultShell = true;
  };

  users.groups.thomas.gid = 1000;
}
