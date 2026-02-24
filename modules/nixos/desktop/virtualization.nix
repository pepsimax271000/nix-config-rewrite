{ config, lib, pkgs, vars, ... }: lib.mkIf config.custom.virtualization.enable {

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
      ${vars.username} = {
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
