{ inputs, self, ... }:
{
  flake-file.inputs = {
    systems.url = "github:nix-systems/default";
    flake-compat = {
      url = "github:nixos/flake-compat";
      flake = false;
    };
    jetbrains-plugins = {
      url = "github:nix-community/nix-jetbrains-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.flake-compat.follows = "flake-compat";
    };
  };

  flake.nixosModules.goland = {
    imports = [ self.nixosModules.jetbrains ];
    home-manager.sharedModules = [ self.homeModules.goland ];
  };

  flake.nixosModules.pycharm = {
    imports = [ self.nixosModules.jetbrains ];
    home-manager.sharedModules = [ self.homeModules.pycharm ];
  };

  # run `sudo sysctl --system` to apply
  flake.nixosModules.jetbrains = {
    environment.etc."sysctl.d/jetbrains.conf".text = ''
      fs.inotify.max_user_watches = 1048576
    '';
  };

  flake.homeModules.goland =
    { pkgs, ... }:
    {
      home.packages = [
        (inputs.jetbrains-plugins.lib.buildIdeWithPlugins pkgs "goland" [
          "ru.adelf.idea.dotenv"
          "mobi.hsz.idea.gitignore"
          "net.seesharpsoft.intellij.plugins.csv"
          "com.github.copilot"
          "com.intellij.lang.jsgraphql"
          "com.intellij.ideolog"
          "org.mvnsearch.plugins.justPlugin"
          "com.redhat.devtools.lsp4ij"
          "monokai-pro-lifetime"
          "NodeJS"
          "intellij.prettierJS"
          "izhangzhihao.rainbow.brackets.lite"
          "String Manipulation"
          "com.intellij.tailwindcss"
          "com.intellij.tasks"
          "intellij.vitejs"
          "org.toml.lang"
          "com.github.oxc.project.oxcintellijplugin"
          "com.github.l34130.mise"
        ])
      ];
    };

  flake.homeModules.pycharm = { pkgs, ... }: {
    home.packages = [
      (inputs.jetbrains-plugins.lib.buildIdeWithPlugins pkgs "pycharm" [
        "org.mvnsearch.plugins.justPlugin"
        "com.intellij.plugins.vscodekeymap"
        "String Manipulation"
        "com.koxudaxi.ruff"
        "izhangzhihao.rainbow.brackets.lite"
        "com.koxudaxi.pydantic"
        "monokai-pro-lifetime"
        "com.github.l34130.mise"
        "com.redhat.devtools.lsp4ij"
        "com.intellij.ideolog"
        "com.intellij.lang.jsgraphql"
        "com.github.copilot"
        "net.seesharpsoft.intellij.plugins.csv"
        "mobi.hsz.idea.gitignore"
        "com.github.oxc.project.oxcintellijplugin"
        "com.github.l34130.mise"
      ])
    ];
  };
}
