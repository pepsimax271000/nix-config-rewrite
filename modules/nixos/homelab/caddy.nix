{ config, lib, pkgs, ... }:
let
  hl  = config.homelab;
  cfg = hl.caddy;
in {

  config = lib.mkIf cfg.enable {

    services = {
      caddy = {
        enable = true;
        email  = cfg.email;

        package = pkgs.caddy.withPlugins {
          plugins = [ "github.com/caddy-dns/cloudflare@v0.0.0-20240703190432-89f16b99c18e" ];
          hash    = lib.fakeHash;
        };

        globalConfig = ''
          auto_https off
        '';

      };
    };

    networking = {
      firewall = {
        allowedTCPPorts = [ 80 443 ];
      };
    };

  };

}
