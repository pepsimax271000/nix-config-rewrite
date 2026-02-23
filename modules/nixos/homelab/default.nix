{ ... }: {

  imports = [
    ./options.nix
    ./users.nix
    ./caddy.nix
    ./services/jellyfin.nix
    ./services/nextcloud.nix
    ./services/vaultwarden.nix
    ./services/grafana.nix
    ./services/paperless.nix
    ./services/prometheus.nix
    ./services/backup.nix
    ./services/ssh.nix
  ];

}
