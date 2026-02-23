{ config, ... }:
let
  hl = config.homelab;
in {

  users = {

    groups = {
      ${hl.svc.group} = {
        gid = hl.svc.gid;
      };
    };

    users = {
      ${hl.svc.user} = {
        uid          = hl.svc.uid;
        group        = hl.svc.group;
        isSystemUser = true;
      };
    };

  };

}
