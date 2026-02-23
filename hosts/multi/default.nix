{ inputs, outputs, hostname, config, ... }: {

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
    productivity.enable   = false;
    laptop.enable         = false;
    nfs.enable            = true;
    bootloader = {
      type = "grub";
    };
  };

  home-manager = {
    useGlobalPkgs    = true;
    useUserPackages  = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.ye = import ../../home/ye/desktop.nix;
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
