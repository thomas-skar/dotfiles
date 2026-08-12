{ pkgs, ... }:

{
  home.stateVersion = "26.11";

  home.packages = with pkgs; [
    btop
    nil
    nixd
    mise
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Thomas Skar";
      user.email = "thomas.skar@intility.no";
    };
    init.defaultBranch = "main";
  };
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      if [ -f "/etc/profile.d/system-manager-path.sh" ]; then
        source "/etc/profile.d/system-manager-path.sh"
      fi
    '';
  };
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
  programs.ghostty.enable = true;
  programs.zed-editor.enable = true;
}
