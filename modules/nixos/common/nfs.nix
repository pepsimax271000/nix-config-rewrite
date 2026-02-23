{ config, lib, pkgs, ... }: {

  options.custom.nfs = {

    enable = lib.mkEnableOption "nfs automounts";

    server = lib.mkOption {
      type    = lib.types.str;
      default = "10.1.10.3";
    };

    mounts = lib.mkOption {
      type    = lib.types.attrsOf lib.types.str;
      default = {};
      example = { "/media/NAS" = "/"; };
    };

  };

  config = lib.mkIf (config.custom.nfs.enable) {

    environment = {
      systemPackages = [ pkgs.nfs-utils ];
    };

    services = {
      rpcbind = {
        enable = true;
      };
    };

    fileSystems = lib.mapAttrs (localPath: remotePath: {
      device  = "${config.custom.nfs.server}:${remotePath}";
      fsType  = "nfs";
      options = [
        "x-systemd.automount"
        "noauto"
        "x-systemd.idle-timeout=600"
        "x-systemd.device-timeout=5s"
        "x-systemd.mount-timeout=5s"
        "soft"
        "timeo=15"
      ];
    }) config.custom.nfs.mounts;

  };

}
