{ ... }: {

  programs = {

    fish = {
      enable = true;

      shellAliases = {
        ls  = "eza";
        ll  = "eza -la";
        cat = "bat";
      };

    };

    eza = {
      enable = true;
    };

    bat = {
      enable = true;
    };

  };

}
