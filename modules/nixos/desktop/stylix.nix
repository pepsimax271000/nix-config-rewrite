{ config, lib, pkgs, ... }: lib.mkIf config.custom.desktop.enable {

  stylix = {

    enable = true;

    image = ../../../wallpapers/leaves.jpg;

#    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    polarity = "dark";

    fonts = {

      monospace = {
        package = pkgs.nerd-fonts.sauce-code-pro;
        name    = "SauceCodePro Nerd Font Mono";
      };

      sansSerif = {
        package = pkgs.inter;
        name    = "Inter";
      };

      serif = {
        package = pkgs.inter;
        name    = "Inter";
      };

      sizes = {
        terminal     = 10;
        applications = 12;
        desktop      = 12;
        popups       = 12;
      };

    };

    cursor = {
      package = pkgs.bibata-cursors;
      name    = "Bibata-Modern-Ice";
      size    = 24;
    };

  };

}
