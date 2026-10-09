{ self, ... }:
{
  flake.homeModules.tealdeer = {
    programs.tealdeer = {
      enable = true;
      settings = { };
    };
  };

  flake.homeModules.tldr = self.homeModules.tealdeer;
}
