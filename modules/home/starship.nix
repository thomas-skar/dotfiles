{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableInteractive = true;
    enableTransience = false;
    settings = {
      format = "$all$custom$line_break$status$container$shell$character";
      add_newline = false;
      follow_symlinks = true;

      battery = {
        disabled = true;
      };

      buf = {
        disabled = false;
        symbol = "buf ";
        style = "bold blue";
      };

      bun = {
        disabled = false;
        symbol = "bun ";
        style = "bold red";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
        # TODO: vimcmd
      };

      cmd_duration = {
        disabled = false;
        style = "yellow bold";
      };

      container = {
        disabled = false;
        symbol = "⬢";
        style = "bold red dimmed";
      };

      deno = {
        disabled = false;
        symbol = "deno ";
        style = "green bold";
      };

      directory = {
        disabled = false;
        style = "cyan bold";
        truncation_length = 5;
        truncate_to_repo = false;
        truncation_symbol = "../";
        read_only = "ro ";
        read_only_style = "red";
        home_symbol = "~";
        use_os_path_sep = false;
      };

      direnv = {
        disabled = false;
        symbol = "direnv ";
        style = "bold orange";
      };

      docker_context = {
        disabled = false;
        symbol = "docker ";
        style = "blue bold";
      };

      fill = {
        disabled = false;
        symbol = ".";
        style = "bold black";
      };

      git_branch = {
        disabled = false;
        always_show_remote = true;
        format = "on [$symbol($remote_name )$branch]($style) ";
        symbol = "git ";
        style = "bold purple";
        ignore_branches = [ ];
      };

      git_commit = {
        disabled = false;
        style = "green bold";
        tag_disabled = true;
        tag_symbol = " tag ";
      };

      git_state = {
        disabled = false;
        style = "bold yellow";
      };

      git_metrics = {
        disabled = true;
        ignore_submodules = true;
      };

      git_status = {
        disabled = false;
        ignore_submodules = true;
        style = "red bold";
        ahead = "⇡"; # >
        behind = "⇣"; # <
        diverged = "⇕"; # <>
        renamed = "»"; # r
        deleted = "✘"; # x
      };

      golang = {
        disabled = false;
        symbol = "go ";
        style = "bold cyan";
        not_capable_style = "bold red";
      };

      guix_shell = {
        disabled = false;
        symbol = "guix ";
        style = "yellow bold";
      };

      helm = {
        disabled = false;
        symbol = "helm ";
        style = "bold white";
      };

      hostname = {
        disabled = false;
        ssh_only = true;
        ssh_symbol = "ssh ";
        style = "bold dimmed green";
      };

      kubernetes = {
        disabled = false;
        symbol = "k8s ";
        format = "[\\[$context\\]]($style) "; # $symbol
        style = "red";
        contexts = [ ];
        context_aliases = { };
        user_aliases = { };
      };

      line_break = {
        disabled = false;
      };

      localip = {
        disabled = false;
        ssh_only = true;
        style = "yellow bold";
      };

      lua = {
        disabled = false;
        symbol = "lua ";
        style = "bold blue";
      };

      memory_usage = {
        disabled = true;
        symbol = "mem ";
        threshold = 75;
      };

      mise = {
        disabled = false;
        symbol = "mise ";
        style = "bright-red";
      };

      nix_shell = {
        disabled = false;
        symbol = "nix ";
        style = "bold blue";
        impure_msg = "i";
        pure_msg = "p";
        unknown_msg = "?";
        heuristic = false;
      };

      nodejs = {
        disabled = false;
        symbol = "node ";
        style = "bold green";
      };

      os = {
        disabled = true;
      };

      package = {
        disabled = false;
        symbol = "pkg ";
        style = "bold 208";
        display_private = false;
      };

      python = {
        disabled = false;
        format = "via [$pyenv_prefix$symbol($version )(\(venv:$virtualenv\) )]($style)";
        version_format = "$major.$minor";
        symbol = "py ";
        style = "yellow bold";
        pyenv_prefix = "pyenv ";
      };

      rust = {
        disabled = false;
        symbol = "rs ";
        style = "bold red";
      };

      shell = {
        disabled = false;
        bash_indicator = "bash ";
        fish_indicator = "";
        zsh_indicator = "zsh ";
        nu_indicator = "nu ";
        unknown_indicator = "? ";
        format = "[$indicator]($style)";
        style = "dimmed bold";
      };

      shlvl = {
        disabled = true;
        symbol = "lvl ";
        style = "bold yellow";
        threshold = 3;
      };

      status = {
        disabled = true;
      };

      sudo = {
        disabled = false;
        symbol = "sudo ";
        style = "bold blue";
      };

      terraform = {
        disabled = false;
        symbol = "tf ";
        style = "bold 105";
      };

      time = {
        disabled = true;
        use_12hr = false;
      };

      username = {
        disabled = false;
        style_root = "red bold";
        style_user = "yellow bold";
        show_always = false;
      };

      vcs = {
        disabled = false;
        order = [ "git" ];
        git_modules = "$git_branch$git_commit$git_state$git_metrics$git_status";
      };

      zig = {
        disabled = false;
        symbol = "z ";
        style = "bold yellow";
      };

      # ------------------
      # ----- custom -----
      # ------------------

      custom.git_user_1 = {
        command = "git config user.name";
        when = "git rev-parse --is-inside-work-tree 2> /dev/null";
        format = "- [$output]($style)";
        style = "dimmed white";
        require_repo = true;
      };

      custom.git_user_2 = {
        command = "git config user.email";
        when = "git rev-parse --is-inside-work-tree 2> /dev/null";
        format = " [\\($output\\)]($style)";
        style = "dimmed white";
        require_repo = true;
      };
    };
  };
}
