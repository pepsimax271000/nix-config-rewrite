{ inputs, outputs, hostname, config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/common
    ../../modules/nixos/desktop
    ../../modules/nixos/laptop
  ];


  networking.networkmanager.enable = true;
  boot = {
    blacklistedKernelModules = [ "nouveau" "nvidia" ];
    kernelModules = [ "thinkpad_acpi" ];
    kernelParams = [ 
      "i915.enable_psr=1"
      "i915.enable_rc6=7"
      "pcie_aspm=force"
    ];
    extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
      blacklist nouveau
      blacklist nvidia
    '';
  };

  networking = {
    hostName = hostname;
  };

  custom = {
    desktop.enable        = true;
    gaming.enable         = false;
    virtualization.enable = false;
    productivity.enable   = false;
    laptop.enable         = true;
    nfs.enable            = true;
    bootloader = {
      type = "systemd-boot";
    };
  };

  home-manager = {
    useGlobalPkgs    = true;
    useUserPackages  = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.ye = import ../../home/ye/desktop.nix;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-vaapi-driver
      ];
    };
  };
}
