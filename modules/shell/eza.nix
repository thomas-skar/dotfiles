{
  flake.homeModules.eza = { lib, ... }: {
    programs.eza.enable = true;

    programs.fish.shellAbbrs = {
      ls = lib.mkForce "eza -l";
      lsa = lib.mkForce "eza -la";
      lsd = "eza -loa --no-permissions --total-size --smart-group";
    };
  };
}
