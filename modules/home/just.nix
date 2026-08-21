{ pkgs, ... }:
{
  home.packages = [
    pkgs.just
    pkgs.just-lsp
  ];

  # TODO: environment variable: path >>> flake.nix
  home.file.".justfile".text = ''
    [private]
    default:
      @just --list --global-justfile

    switch:
      echo "todo"
  '';
}
