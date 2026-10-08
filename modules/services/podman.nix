{ self, ... }:
{
  flake.nixosModules.podman = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.passt
      pkgs.slirp4netns
      pkgs.fuse-overlayfs
      pkgs.crun
    ];

    security.wrappers = {
      newuidmap = {
        owner = "root";
        group = "root";
        source = "${pkgs.shadow}/bin/newuidmap";
        capabilities = "cap_setuid,cap_setfcap+eip";
      };
      newgidmap = {
        owner = "root";
        group = "root";
        source = "${pkgs.shadow}/bin/newgidmap";
        capabilities = "cap_setgid,cap_setfcap+eip";
      };
    };

    home-manager.sharedModules = [ self.homeModules.podman ];
  };

  flake.homeModules.podman = { pkgs, config, ... }: {
    home.packages = [ pkgs.shadow ];

    services.podman = {
      enable = true;
      autoUpdate.enable = false;
      settings = {
        containers = {
          network = {
            network_backend = "netavark";
            default_rootless_network_cmd = "pasta";
            rootless_port_forwarder = "rootlessport";
          };
          engine = {
            runtime = "${pkgs.crun}/bin/crun";
            database_backend = "sqlite";
            network_cmd_path = "${pkgs.slirp4netns}/bin/slirp4netns";
            static_dir = "${config.home.homeDirectory}/.local/share/containers/storage/libpod";
            volume_path = "${config.home.homeDirectory}/.local/share/containers/storage/volumes";
          };
        };
        storage = {
          storage = {
            driver = "overlay";
            rootless_storage_path = "$HOME/.local/share/containers/storage";
          };
        };
      };
    };

    programs.fish.shellAbbrs = {
      pps = "podman ps -a";
      ppsa = "podman ps -a";
      ppsw = "podman ps -a -w 1";
      pprmaf = "podman pod rm --all --force";
      pkp = "podman kube play --replace";
      pkd = "podman kube down";
    };
  };
}
