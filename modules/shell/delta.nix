{
  flake.homeModules.delta = { pkgs, config, ... }: {
    home = {
      packages = [ pkgs.less ];
      # sessionVariables = { DELTA_PAGER = ""; };
    };

    programs.delta = {
      enable = true;
      enableGitIntegration = config.programs.git.enable;
      enableJujutsuIntegration = config.programs.jujutsu.enable;
      options = {
        navigate = true;
        dark = true;
        line-numbers = true;
        hyperlinks = true;
        side-by-side = true;
        features = "side-by-side line-numbers unobtrusive-line-numbers decorations";
        unobtrusive-line-numbers = {
          line-numbers = true;
        };
        decorations = { };
      };
    };

    programs.git.settings = {
      core = {
        # pager = "delta";
        pager = "LESS='FR --redraw-on-quit' delta";
      };
      merge = {
        conflictStyle = "zdiff3";
      };
      diff = {
        colorMoved = "default";
      };
    };
  };
}
