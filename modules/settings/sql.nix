{
  flake.nixosModules.sql = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.sqlite
      pkgs.unixodbc
      pkgs.unixodbcDrivers.psql
      pkgs.unixodbcDrivers.sqlite
      pkgs.unixodbcDrivers.msodbcsql18
    ];
  };
}
