{ config, lib, pkgs, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.nextcloud;

  isServer1 = config.networking.hostName == "server1";
  isServer2 = config.networking.hostName == "server2";
in {

  config = lib.mkIf cfg.enable {

    services = lib.mkMerge [

      (lib.mkIf isServer2 {
        nextcloud = {
          enable   = true;
          hostName = "${cfg.subdomain}.${hl.domain}";
          package  = pkgs.nextcloud29;

          datadir = hl.paths.data;

          config = {
            adminpassFile = config.sops.secrets.nextcloud-admin-pass.path;
          };

          settings = {
            trusted_domains = [ "${cfg.subdomain}.${hl.domain}" ];
          };
        };
      })

      (lib.mkIf isServer1 {
        caddy = {
          virtualHosts = {
            "${cfg.subdomain}.${hl.domain}" = {
              extraConfig = lib.optionalString cfg.internal ''
                @blocked not remote_ip ${hl.adminCIDR}
                abort @blocked
              '' + ''
                tls {
                  dns cloudflare {env.CF_API_TOKEN}
                }
                reverse_proxy ${hl.servers.server2.ip}:${toString cfg.port}
              '';
            };
          };
        };
      })

    ];

    networking = lib.mkIf isServer2 {
      firewall = {
        allowedTCPPorts = [ cfg.port ];
      };
    };

  };

}
