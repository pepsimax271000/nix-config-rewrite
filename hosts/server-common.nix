{ ... }: {

  imports = [
    ../modules/nixos/common
    ../modules/nixos/homelab
  ];

  homelab = {

    domain    = "yourdomain.com";
    adminCIDR = "192.168.1.0/24";

    servers = {
      server1 = { ip = "192.168.1.10"; };
      server2 = { ip = "192.168.1.11"; };
    };

    svc = {
      user  = "svc";
      group = "svc";
      uid   = 900;
      gid   = 900;
    };

    paths = {
      data   = "/data";
      media  = "/data/media";
      backup = "/data/backup";
    };

    caddy = {
      email = "you@yourdomain.com";
    };

  };

}
