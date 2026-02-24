{ inputs, outputs, hostname, config, vars, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/desktop
  ];

  networking = {
    hostName = hostname;
  };

  custom = {
    desktop.enable        = true;
    gaming.enable         = false;
    virtualization.enable = false;
    laptop.enable         = false;
    nfs.enable            = true;
    bootloader = {
      type = "grub";
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.amdgpu = {
    opencl.enable = true;
  };

  swapDevices = [{
    device = "/swap/swapfile";
    size = 16*1024;
  }];

}
