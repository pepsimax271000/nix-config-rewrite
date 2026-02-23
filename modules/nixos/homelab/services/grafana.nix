{ config, lib, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.grafana;

  isServer1 = config.networking.hostName == "server1";
in {

  config = lib.mkIf cfg.enable {

    # grafana runs on server1 alongside caddy
    services = lib.mkIf isServer1 {

      grafana = {
        enable = true;

        settings = {
          server = {
            http_addr = "127.0.0.1";
            http_port = cfg.port;
            domain    = "${cfg.subdomain}.${hl.domain}";
          };
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
