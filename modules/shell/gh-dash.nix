{
  flake.homeModules.gh-dash = { pkgs, ... }: {
    home = {
      packages = [ pkgs.gh-enhance ];
      sessionVariables.ENHANCE_THEME = "monokai_remastered"; # "monokai_pro"
    };

    programs.gh-dash = {
      enable = true;
      settings = {
        confirmQuit = false;
        defaults = {
          view = "prs";
          preview = {
            open = true;
            position = "auto";
          };
          prsLimit = 10;
          issuesLimit = 10;
          notificationsLimit = 10;
        };
        theme = {
          ui = {
            sectionsShowCount = true;
            table.compact = false;
          };
        };
        pager.diff = "delta";
        prSections = [
          {
            title = "Pull requests";
            filters = "is:open";
          }
        ];
        issuesSections = [
          {
            title = "Issues";
            filters = "is:open";
          }
        ];
        keybindings = {
          universal = [
            {
              key = "pgup";
              builtin = "pageUp";
            }
            {
              key = "pgdown";
              builtin = "pageDown";
            }
          ];
          prs = [
            {
              key = "T";
              command = "gh-enhance -R {{.RepoName}} {{.PrNumber}}";
            }
            {
              key = "J";
              builtin = "prevSidebarTab";
            }
            {
              key = "K";
              builtin = "nextSidebarTab";
            }
          ];
          issues = [ ];
          notifications = [ ];
        };
      };
    };

    programs.fish.shellAbbrs = {
      gd = "gh-dash";
      ghd = "gh-dash";
      ghe = "gh-enhance";
      gha = "gh-enhance";
    };
  };
}
