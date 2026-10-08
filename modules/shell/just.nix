{
  flake.homeModules.just = { pkgs, ... }: {
    home.packages = [ pkgs.just ];

    programs.fish.shellAbbrs = {
      j = "just";
      jg = "just --global-justfile";
    };

    home.file.".justfile".text = ''
      [private]
      default:
        @just --list --global-justfile
    '';
  };
}
