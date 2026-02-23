{ pkgs, ... }: {

  users = {

    mutableUsers = true;

    users = {
      ye = {
        isNormalUser = true;
        shell        = pkgs.fish;

        extraGroups = [
          "wheel"
          "networkmanager"
          "video"
          "audio"
        ];
      };

    };

  };

  programs = {
    fish = {
      enable = true;
    };
  };

}
