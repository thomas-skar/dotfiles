{ withSystem, ... }: {
  flake-file.inputs.zapp = {
    url = "github:zsa/zapp";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.nixosModules.zsa = withSystem "x86_64-linux" (
    { pkgs, inputs', ... }:
    {
      environment.systemPackages = [
        inputs'.zapp.packages.default
        pkgs.kontroll
        pkgs.keymapp
      ];

      # services.udev.packages = [ inputs'.zapp.packages.default ];
    }
  );
}
