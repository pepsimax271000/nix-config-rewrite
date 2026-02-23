{ config, lib, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.vaultwarden;

  isServer1 = config.networking.hostName == "server1";
  isServer2 = config.networking.hostName == "server2";
in {

  config = lib.mkIf cfg.enable {

    services = lib.mkMerge [

      (lib.mkIf isServer2 {
        vaultwarden = {
          enable = true;

          config = {
            ROCKET_ADDRESS = "0.0.0.0";
            ROCKET_PORT    = cfg.port;
            DATA_FOLDER    = "${hl.paths.data}/vaultwarden";
            DOMAIN         = "https://${cfg.subdomain}.${hl.domain}";
            SIGNUPS_ALLOWED = false;
          };

        };
      })

      (lib.mkIf isServer1 {
        caddy = {
          virtualHosts = {
            "${cfg.subdomain}.${hl.domain}" = {
              extraConfig = ''
                @blocked not remote_ip ${hl.adminCIDR}
                abort @blocked
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
