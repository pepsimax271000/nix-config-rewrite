{ config, lib, inputs, pkgs, ... }: lib.mkIf config.custom.desktop.enable {

  programs = {

    hyprland = {
      enable        = true;
      package       = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };

  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL  = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      HYPRLAND_LOG_WLR = "1";
    };
  };

}
