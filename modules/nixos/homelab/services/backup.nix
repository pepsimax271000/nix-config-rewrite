{ config, lib, ... }:
let
  hl  = config.homelab;
  cfg = hl.services.backup;
in {

  config = lib.mkIf cfg.enable {

    services = {

      restic = {
        backups = {
          data = {
            paths = [
              hl.paths.data
            ];

            repository   = "rest:http://backup-server/repo";
            passwordFile = config.sops.secrets.restic-password.path;

            timerConfig = {
              OnCalendar  = "02:00";
              Persistent  = true;
            };

            pruneOpts = [
              "--keep-daily 7"
              "--keep-weekly 4"
              "--keep-monthly 6"
            ];

          };
        };
      };

    };

  };

}
