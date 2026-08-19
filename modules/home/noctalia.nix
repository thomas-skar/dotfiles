{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # TODO: noctalia config export
  programs.noctalia = {
    enable = true;
    systemd.enable = false;
  };

}
