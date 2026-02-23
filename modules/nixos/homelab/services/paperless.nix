{ config, lib, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.paperless;

  isServer1 = config.networking.hostName == "server1";
in {

  config = lib.mkIf cfg.enable {

    services = lib.mkIf isServer1 {

      paperless = {
        enable    = true;
        dataDir   = "${hl.paths.data}/paperless";
        mediaDir  = "${hl.paths.data}/paperless/media";
        address   = "127.0.0.1";
        port      = cfg.port;
        user      = hl.svc.user;

        settings = {
          PAPERLESS_OCR_LANGUAGE = "eng";
          PAPERLESS_URL          = "https://${cfg.subdomain}.${hl.domain}";
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
