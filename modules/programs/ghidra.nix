{
  flake.homeModules.ghidra = { pkgs, ... }: {
    home.packages = [ pkgs.ghidra ];
  };
}
