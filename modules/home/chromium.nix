{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    package = pkgs.chromium; # TODO: ungoogled-chromium ?
  };
}
