{ self, ... }:
{
  flake.nixosModules.k8s = {
    home-manager.sharedModules = [ self.homeModules.k8s ];
  };

  flake.homeModules.k8s = { pkgs, ... }: {
    home.packages = [
      pkgs.kubectl
      pkgs.kustomize
      pkgs.openshift
    ];

    programs.kubeswitch.enable = true;

    programs.k9s = {
      enable = true;
      settings.k9s = {
        noExitOnCtrlC = false;
        portForwardAddress = "127.0.0.1";
        ui.enableMouse = true;
        ui.logoless = true;
        ui.noIcons = false;
        ui.skin = "monokai";
      };
    };

    # https://github.com/derailed/k9s/blob/master/skins/monokai.yaml
    home.file.".config/k9s/skins/monokai.yaml".text = ''
      foreground: &foreground "#ffffff"
      background: &background "default"
      backgroundOpaque: &backgroundOpaque "#333333"
      magenta: &magenta "#f72972"
      orange: &orange "#e47c20"
      lightBlue: &lightBlue "#c3eff7"
      blue: &blue "#69d9ed"
      darkBlue: &darkBlue "#3174a2"
      green: &green "#a7e24c"
      purple: &purple "#856cc4"
      yellow: &yellow "#e1df8f"
      darkGray: &darkGray "#666666"

      k9s:
        body:
          fgColor: *foreground
          bgColor: *background
          logoColor: *purple
          logoColorMsg: *foreground
          logoColorInfo: *lightBlue
          logoColorWarn: *orange
          logoColorError: *magenta

        prompt:
          fgColor: *foreground
          bgColor: *background
          suggestColor: *darkGray

        info:
          fgColor: *magenta
          sectionColor: *yellow

        help:
          fgColor: *foreground
          bgColor: *background
          keyColor: *green
          numKeyColor: *green
          sectionColor: *blue

        dialog:
          fgColor: *yellow
          bgColor: *background
          buttonFgColor: *foreground
          buttonBgColor: *background
          buttonFocusFgColor: *foreground
          buttonFocusBgColor: *purple
          labelFgColor: *magenta
          fieldFgColor: *darkBlue

        frame:
          border:
            fgColor: *darkGray
            focusColor: *darkGray

          menu:
            fgColor: *foreground
            keyColor: *magenta
            numKeyColor: *green

          crumbs:
            fgColor: *yellow
            bgColor: *backgroundOpaque
            activeColor: *purple

          status:
            newColor: *blue
            modifyColor: *purple
            addColor: *green
            pendingColor: *orange
            errorColor: *magenta
            highlightColor: *blue
            killColor: *magenta
            completedColor: *darkBlue

          title:
            fgColor: *purple
            bgColor: *background
            highlightColor: *yellow
            counterColor: *green
            filterColor: *orange

        views:
          charts:
            bgColor: *background
            dialBgColor: *background
            chartBgColor: *backgroundOpaque
            defaultDialColors:
              - *blue
              - *magenta
            defaultChartColors:
              - *blue
              - *magenta
            resourceColors:
              batch/v1/jobs:
                - *blue
                - *magenta
              v1/persistentvolumes:
                - *blue
                - *magenta
              cpu:
                - *blue
                - *magenta
              mem:
                - *blue
                - *magenta
              v1/events:
                - *blue
                - *magenta
              v1/pods:
                - *blue
                - *magenta

          table:
            fgColor: *foreground
            bgColor: *background
            cursorFgColor: *foreground
            cursorBgColor: *backgroundOpaque
            markColor: *magenta
            header:
              fgColor: *foreground
              bgColor: *backgroundOpaque
              sorterColor: *magenta

          xray:
            fgColor: *foreground
            bgColor: *background
            cursorColor: *blue
            cursorTextColor: *foreground
            graphicColor: *blue

          yaml:
            keyColor: *green
            colonColor: *magenta
            valueColor: *foreground

          logs:
            fgColor: *foreground
            bgColor: *background
            indicator:
              fgColor: *foreground
              bgColor: *backgroundOpaque
              toggleOnColor: *green
              toggleOffColor: *magenta
    '';

  };
}
