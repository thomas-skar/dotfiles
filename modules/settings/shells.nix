{
  flake.nixosModules.etc-shells = { pkgs, ... }: {
    environment.etc."shells" = {
      enable = true;
      user = "root";
      group = "root";
      mode = "0644";
      replaceExisting = true;
      text = ''
        /bin/sh
        /usr/bin/sh
        /bin/bash
        /usr/bin/bash
        /bin/rbash
        /usr/bin/rbash
        /usr/bin/dash
        /usr/local/bin/fish
        ${pkgs.fish}/bin/fish
      '';
    };

    systemd.tmpfiles.rules = [
      "L+ /usr/local/bin/fish - - - - ${pkgs.fish}/bin/fish"
    ];
  };
}
