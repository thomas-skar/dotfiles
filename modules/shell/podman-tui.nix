{
  flake.homeModules.podman-tui =
    { pkgs, config, ... }:
    let
      packages = if config.services.podman.enable then [ pkgs.podman-tui ] else [ ];
    in
    {
      home.packages = packages;
    };
}
