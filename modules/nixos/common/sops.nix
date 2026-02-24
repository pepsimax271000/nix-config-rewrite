{ config, vars, ... }: {

  sops = {

    defaultSopsFile = ../../../secrets/secrets.yaml;

    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/home/${vars.username}/.config/sops/age/keys.txt";
      generateKey = false;
    };

    secrets = {
      hashed_password = {
        neededForUsers = true;
      };

      password = {};

    };
  };
}
