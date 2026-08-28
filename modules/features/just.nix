{
  flake.homeModules.just = { pkgs, ... }: {
    home.packages = [
      pkgs.just
    ];

    home.file.".justfile".text = ''
      [private]
      default:
        @just --list --global-justfile
    '';
  };
}
