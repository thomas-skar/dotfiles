{ pkgs, ... }:
{
  home.packages = [ pkgs.wdisplays ];

  services.kanshi = {
    enable = true;
    profiles = {
      "undocked" = {
        outputs = [
          { criteria = "eDP-1"; }
        ];
      };
      "docked" = {
        outputs = [
          {
            criteria = "eDP-1";
            position = "1280,1440";
          }
          {
            criteria = "DVI-I-1";
            position = "2560,0";
          }
          {
            criteria = "DVI-I-2";
            position = "0,0";
          }
        ];
      };
    };
  };

}
