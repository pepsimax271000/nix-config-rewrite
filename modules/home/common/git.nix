{ ... }: {

  programs = {

    git = {
      enable = true;

      settings.user = {
        name = "pepsimax271000";
        email = "248238336+pepsimax271000@users.noreply.github.com";
      };

      settings = {
        init = {
          defaultBranch = "master";
        };
        pull = {
          rebase = true;
        };
        push = {
          autoSetupRemote = true;
        };
      };

    };
  };
}
