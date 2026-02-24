{ ... }: {

  security = {

    sudo = {
      wheelNeedsPassword = true;
    };

    rtkit = {
      enable = true;
    };

  };

  networking = {
    firewall = {
      enable = false;
    };
  };

}
