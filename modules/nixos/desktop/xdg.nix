{ config, lib, ... }: lib.mkIf config.custom.desktop.enable {

  xdg = {
    mime = {
      enable = true;
    };
  };

  environment = {
    sessionVariables = {
      XDG_SESSION_TYPE    = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
    };
  };

}
