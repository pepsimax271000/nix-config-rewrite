{ config, lib, pkgs, ... }: lib.mkIf config.custom.virtualization.enable {

  virtualisation = {

    libvirtd = {
      enable = true;
    };

    spiceUSBRedirection = {
      enable = true;
    };

  };

  programs = {
    virt-manager = {
      enable = true;
    };
  };

  users = {
    users = {
      ye = {
        extraGroups = [ "libvirtd" ];
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      virt-viewer
      spice-gtk
    ];
  };

}
