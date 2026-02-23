{ lib, ... }: {

  options.homelab = {

    domain = lib.mkOption {
      type    = lib.types.str;
      example = "yourdomain.com";
    };

    localDomain = lib.mkOption {
      type    = lib.types.str;
      default = "home.arpa";
    };

    adminCIDR = lib.mkOption {
      type    = lib.types.str;
      default = "192.168.1.0/24";
    };

    servers = {

      server1 = {
        ip = lib.mkOption {
          type    = lib.types.str;
          default = "192.168.1.10";
        };
      };

      server2 = {
        ip = lib.mkOption {
          type    = lib.types.str;
          default = "192.168.1.11";
        };
      };

    };

    svc = {

      user = lib.mkOption {
        type    = lib.types.str;
        default = "svc";
      };

      group = lib.mkOption {
        type    = lib.types.str;
        default = "svc";
      };

      uid = lib.mkOption {
        type    = lib.types.int;
        default = 900;
      };

      gid = lib.mkOption {
        type    = lib.types.int;
        default = 900;
      };

    };

    paths = {

      data = lib.mkOption {
        type    = lib.types.str;
        default = "/data";
      };

      media = lib.mkOption {
        type    = lib.types.str;
        default = "/data/media";
      };

      backup = lib.mkOption {
        type    = lib.types.str;
        default = "/data/backup";
      };

    };

    caddy = {

      enable = lib.mkEnableOption "caddy";

      email = lib.mkOption {
        type = lib.types.str;
      };

      useACME = lib.mkOption {
        type    = lib.types.bool;
        default = true;
      };

    };

    services = {

      jellyfin = {

        enable = lib.mkEnableOption "jellyfin";

        port = lib.mkOption {
          type    = lib.types.port;
          default = 8096;
        };

        subdomain = lib.mkOption {
          type    = lib.types.str;
          default = "jellyfin";
        };

        internal = lib.mkOption {
          type    = lib.types.bool;
          default = false;
        };

      };

      nextcloud = {

        enable = lib.mkEnableOption "nextcloud";

        port = lib.mkOption {
          type    = lib.types.port;
          default = 8080;
        };

        subdomain = lib.mkOption {
          type    = lib.types.str;
          default = "nextcloud";
        };

        internal = lib.mkOption {
          type    = lib.types.bool;
          default = false;
        };

      };

      vaultwarden = {

        enable = lib.mkEnableOption "vaultwarden";

        port = lib.mkOption {
          type    = lib.types.port;
          default = 8222;
        };

        subdomain = lib.mkOption {
          type    = lib.types.str;
          default = "vault";
        };

        internal = lib.mkOption {
          type    = lib.types.bool;
          default = true;
        };

      };

      grafana = {

        enable = lib.mkEnableOption "grafana";

        port = lib.mkOption {
          type    = lib.types.port;
          default = 3000;
        };

        subdomain = lib.mkOption {
          type    = lib.types.str;
          default = "grafana";
        };

        internal = lib.mkOption {
          type    = lib.types.bool;
          default = true;
        };

      };

      paperless = {

        enable = lib.mkEnableOption "paperless";

        port = lib.mkOption {
          type    = lib.types.port;
          default = 8000;
        };

        subdomain = lib.mkOption {
          type    = lib.types.str;
          default = "paperless";
        };

        internal = lib.mkOption {
          type    = lib.types.bool;
          default = true;
        };

      };

      prometheus = {

        enable = lib.mkEnableOption "prometheus";

        port = lib.mkOption {
          type    = lib.types.port;
          default = 9090;
        };

        subdomain = lib.mkOption {
          type    = lib.types.str;
          default = "prometheus";
        };

        internal = lib.mkOption {
          type    = lib.types.bool;
          default = true;
        };

      };

      backup = {
        enable = lib.mkEnableOption "backup";
      };

    };

  };

}
