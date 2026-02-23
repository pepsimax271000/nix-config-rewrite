{ config, lib, pkgs, ... }: lib.mkIf config.custom.gaming.enable {

  programs = {

    steam = {
      enable              = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
    };

    gamemode = {
      enable = true;
    };

  };

  environment = {
    systemPackages = with pkgs; [
      lutris
      heroic
      mangohud
    ];
  };

  hardware = {
    graphics = {
      enable       = true;
      enable32Bit  = true;
    };
  };

}
