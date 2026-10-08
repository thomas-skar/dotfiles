{
  flake.homeModules.fd = {
    programs.fd.enable = true;

    programs.fish.shellAbbrs = {
      find = "fd";
    };
  };
}
