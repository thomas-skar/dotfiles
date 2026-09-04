{ self, ... }:
{
  flake.nixosModules.sql = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.sqlite
      pkgs.unixodbc
      pkgs.unixodbcDrivers.psql
      pkgs.unixodbcDrivers.sqlite
      pkgs.unixodbcDrivers.msodbcsql18
    ];

    home-manager.sharedModules = [ self.homeModules.sql ];
  };

  flake.homeModules.sql = {
    # pkgs.sqlit-tui
    programs.uv.tool.packages = [ "sqlit-tui" ];
  };
}
