{ config, lib, pkgs, ... }: lib.mkIf config.custom.desktop.enable {

  fonts = {

    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.noto
      inter
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Inter" ];
        serif     = [ "Inter" ];
      };
    };

  };

}
