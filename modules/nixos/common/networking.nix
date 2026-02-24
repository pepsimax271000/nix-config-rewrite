{ config, pkgs, ... }:
  {
    services.resolved = {
      enable = true;

      settings.Resolve = {
        DNSSEC = false;
      };
    };
    
    networking = {
      networkmanager = {
        enable = true;
        wifi.backend = "iwd";
        dns = "systemd-resolved";
      };

      enableIPv6 = false;

    };
  }

