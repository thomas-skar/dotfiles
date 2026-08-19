{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "Monokai Pro";
      keybinds = [ ];
    };
    systemd.enable = true;
  };
}
