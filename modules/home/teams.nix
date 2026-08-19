{ pkgs, ... }:
{
  home.packages = [
    pkgs.teams-for-linux
  ];

  home.file.".config/teams-for-linux/config.json".text = ''
    {
      "auth": {
        "intune": {
          "enabled": true,
          "user": "thomas.skar@intility.no"
        }
      }
    }
  '';

}
