{ config, pkgs, vars, ... }: {

  users = {

    mutableUsers = false;

    users = {
      ${vars.username} = {
        isNormalUser = true;
        shell        = pkgs.fish;
        hashedPasswordFile = config.sops.secrets.hashed_password.path;

        extraGroups = [
          "wheel"
          "networkmanager"
          "video"
          "audio"
        ];
      };

      root = {
        hashedPasswordFile = config.sops.secrets.hashed_password.path;
      };
    };

  };

  programs = {
    fish = {
      enable = true;
    };
  };

}
