{
  flake.homeModules.displays = { pkgs, ... }: {
    home.packages = [
      pkgs.wdisplays
      pkgs.wlr-randr
    ];

    services.kanshi = {
      enable = true;

      # TODO: move to modules/system ?
      settings = [
        {
          profile.name = "undocked";
          profile.outputs = [
            { criteria = "eDP-1"; }
          ];
        }
        {
          profile.name = "docked";
          profile.outputs = [
            {
              criteria = "eDP-1";
              position = "1280,1440";
            }
            {
              criteria = "Lenovo Group Limited P27q-20 V90B1496"; # DVI-I-1
              position = "0,0";
            }
            {
              criteria = "Lenovo Group Limited P27q-20 V90AW8FB"; # DVI-I-2
              position = "2560,0";
            }
          ];
        }
      ];
    };
  };
}
