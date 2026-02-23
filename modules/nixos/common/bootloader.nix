{ config, lib, ... }: {

  boot = {
    loader = lib.mkMerge [
      (lib.mkIf (config.custom.bootloader.type == "systemd-boot") {
        systemd-boot = {
          enable       = true;
          configurationLimit = 10;
        };
        efi = {
          canTouchEfiVariables = true;
        };
      })

      (lib.mkIf (config.custom.bootloader.type == "grub") {
        grub = {
          enable  = true;
          device  = config.custom.bootloader.grubDevice;
          useOSProber = true;
        };
      })
    ];
  };
}
