{ inputs, pkgs, ... }: {

  wayland = {
    windowManager = {
      hyprland = {
        enable  = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;

        settings = {

          monitor = [
            # adjust to your setup
            "DVI-D-1,2560x1600@59.97,0x0,1"
            "LVDS-1,1920x1080@60,0x0,1"
          ];

          general = {
            gaps_in          = 5;
            gaps_out         = 10;
            border_size      = 2;
            layout           = "dwindle";
            allow_tearing    = false;
          };

          decoration = {
            rounding     = 0;
            blur = {
              enabled  = false;
              size     = 6;
              passes   = 3;
            };
          };

          animations = {
            enabled = false;

            bezier = [
              "wind,0.05,0.9,0.1,1.05"
              "winIn,0.1,1.1,0.1,1.1"
              "winOut,0.3,-0.3,0,1"
            ];

            animation = [
              "windows,1,6,wind,slide"
              "windowsIn,1,6,winIn,slide"
              "windowsOut,1,5,winOut,slide"
              "fade,1,10,default"
              "workspaces,1,5,wind"
            ];

          };

          input = {
            kb_layout    = "gb";
            follow_mouse = 1;
            touchpad = {
              natural_scroll = true;
            };
          };

          misc = {
            disable_hyprland_logo  = true;
            disable_splash_rendering = true;
            force_default_wallpaper = 0;
          };

          "$mod" = "SUPER";

          bind = [
            "$mod, Q, killactive"
            "$mod, M, exit"
            "$mod, F, fullscreen"
            
            "$mod, Return, exec, foot"
            "$mod, W, exec, zen-beta"
            "$mod, D, exec, noctalia-shell ipc call launcher toggle"
  
            "$mod shift, Space, togglefloating"
            "$mod, h, resizeactive, -100 0"
            "$mod, j, movefocus, l"
            "$mod, k, movefocus, r"
            "$mod, l, resizeactive, 100 0"
            "$mod shift, h, movewindow, l"
            "$mod shift, j, movewindow, d"
            "$mod shift, k, movewindow, u"
            "$mod shift, l, movewindow, r"
            "$mod ctrl, j, movefocus, d"
            "$mod ctrl, k, movefocus, u"

            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"
          ];

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];
        };
      };
    };
  };   
}
