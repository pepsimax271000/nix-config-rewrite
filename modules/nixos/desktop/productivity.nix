{ config, lib, pkgs, ... }: lib.mkIf config.custom.productivity.enable {

  environment = {
    systemPackages = with pkgs; [
      libreoffice-fresh
      obsidian
      thunderbird
    ];
  };

}
