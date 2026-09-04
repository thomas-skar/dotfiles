{ self, ... }:
{
  flake.nixosModules.python = {
    home-manager.sharedModules = [ self.homeModules.python ];
  };

  flake.homeModules.python = { pkgs, lib, ... }: {
    programs.uv.enable = true;

    # home.packages = [
    #   pkgs.stdenv.cc.cc
    # ];

    # home.sessionVariables = {
    #   LB_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
    # };
  };
}
