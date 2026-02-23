{ config, lib, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.prometheus;

  isServer1 = config.networking.hostName == "server1";
in {

  config = lib.mkIf cfg.enable {

    services = lib.mkIf isServer1 {

      prometheus = {
        enable = true;
        port   = cfg.port;

        scrapeConfigs = [
          {
            job_name = "server1";
            static_configs = [{
              targets = [ "localhost:9100" ];
            }];
          }
          {
            job_name = "server2";
            static_configs = [{
              targets = [ "${hl.servers.server2.ip}:9100" ];
            }];
          }
        ];

      };

      # node exporter on every server
      prometheus.exporters = {
        node = {
          enable     = true;
          port       = 9100;
          enabledCollectors = [ "systemd" "processes" ];
        };
      };

      caddy = {
        virtualHosts = {
          "${cfg.subdomain}.${hl.domain}" = {
            extraConfig = ''
              @blocked not remote_ip ${hl.adminCIDR}
              abort @blocked
              tls {
                dns cloudflare {env.CF_API_TOKEN}
              }
              reverse_proxy localhost:${toString cfg.port}
            '';
          };
        };
      };

    };

  };

}
