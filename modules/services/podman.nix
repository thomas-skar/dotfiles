{ self, ... }:
let
  environmentVariables = {
    DOCKER_HOST = "unix:///run/user/1000/podman/podman.sock";
  };
in
{
  flake.nixosModules.podman = { pkgs, ... }: {
    environment = {
      systemPackages = [
        pkgs.passt
        pkgs.slirp4netns
        pkgs.fuse-overlayfs
        pkgs.crun
      ];
      variables = environmentVariables;
      sessionVariables = environmentVariables;
    };

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
    home = {
      packages = [
        pkgs.shadow
        pkgs.docker-client
        pkgs.docker-buildx
        pkgs.docker-compose
      ];
      sessionVariables = environmentVariables;
    };

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

      dps = "docker ps -a";
    };

    systemd.user = {
      enable = true;
      sockets = {
        "podman" = {
          Unit = {
            Description = "Podman API Socket";
            Documentation = "man:podman-system-service(1)";
          };
          Socket = {
            ListenStream = "%t/podman/podman.sock";
            SocketMode = "0660";
          };
          Install = {
            WantedBy = [ "sockets.target" ];
          };
        };
      };
      services = {
        "podman" = {
          Unit = {
            Description = "Podman API Service";
            Requires = [ "podman.socket" ];
            After = [ "podman.socket" ];
            Documentation = "man:podman-system-service(1)";
          };
          Service = {
            Delegate = true;
            Type = "exec";
            KillMode = "process";
            Environment = "PATH=/run/wrappers/bin:$PATH";
            ExecStart = "${pkgs.podman}/bin/podman --log-level=info system service";
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
        };
      };
    };

    programs.docker-cli = {
      enable = true;
      contexts.default.Endpoints.docker.Host = "unix:///run/user/1000/podman/podman.sock";
    };
  };
}
