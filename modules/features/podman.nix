{
  flake.homeModules.podman = { pkgs, ... }: {

    home.packages = [
      pkgs.shadow
    ];

    services.podman = {
      enable = true;
    };

  };
}
