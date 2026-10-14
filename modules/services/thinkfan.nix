{
  flake.nixosModules.thinkfan = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.thinkfan ];
  };
}
