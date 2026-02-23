{ config, lib, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.jellyfin;

  # jellyfin runs on server2, caddy on server1 proxies to it
  # when enabled on server1: adds caddy vhost pointing to server2
  # when enabled on server2: runs the app + opens firewall
  isServer1 = config.networking.hostName == "server1";
  isServer2 = config.networking.hostName == "server2";
in {

  config = lib.mkIf cfg.enable {

    # app config — only on server2
    services = lib.mkMerge [

      (lib.mkIf isServer2 {
        jellyfin = {
          enable  = true;
          dataDir = hl.paths.data;
          user    = hl.svc.user;
          group   = hl.svc.group;
        };
      })

      # caddy vhost — only on server1
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

    # firewall — only on server2
    networking = lib.mkIf isServer2 {
      firewall = {
        allowedTCPPorts = [ cfg.port ];
      };
    };

  };

}
