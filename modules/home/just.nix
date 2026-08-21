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
      nix run 'github:numtide/system-manager' --extra-experimental-features "nix-command flakes" --accept-flake-config -- switch --sudo --flake /home/thomas/code/dotfiles/flake.nix#systemConfigs.default
  '';
}
