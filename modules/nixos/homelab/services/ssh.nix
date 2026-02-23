{ ... }: {

  services = {

    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        PermitRootLogin        = "no";
        KbdInteractiveAuthentication = false;
      };

      ports = [ 22 ];
    };

  };

  networking = {
    firewall = {
      allowedTCPPorts = [ 22 ];
    };
  };

}
