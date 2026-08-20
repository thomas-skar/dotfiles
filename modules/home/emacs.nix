{ inputs, ... }:
{
  imports = [
    inputs.doom-emacs.homeModule
  ];

  programs.doom-emacs = {
    enable = true;
  };

  programs.emacs.enable = false;
}
