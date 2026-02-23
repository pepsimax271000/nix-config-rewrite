{ lib, ... }: {

  options.custom = {

    bootloader = {
      type = lib.mkOption {
        type = lib.types.enum [ "grub" "systemd-boot" ];
        default = "systemd-boot";
      };

      grubDevice = lib.mkOption {
        type = lib.types.str;
        default = "/dev/nvme0n1";
      };
    };

    desktop = {
      enable = lib.mkEnableOption "desktop environment";
    };

    gaming = {
      enable = lib.mkEnableOption "gaming";
    };

    virtualization = {
      enable = lib.mkEnableOption "virtualization";
    };

    productivity = {
      enable = lib.mkEnableOption "productivity applications";
    };

    laptop = {
      enable = lib.mkEnableOption "laptop power management";
    };

  };

}
