{ pkgs, ... }:
{
  home.packages = [ pkgs.wdisplays ];

  services.kanshi = {
    enable = true;
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
            criteria = "DVI-I-1";
            position = "2560,0";
          }
          {
            criteria = "DVI-I-2";
            position = "0,0";
          }
        ];
      }
    ];
  };

}
