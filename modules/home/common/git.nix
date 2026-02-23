{ ... }: {

  programs = {

    git = {
      enable = true;

      settings.user = {
        name = "pepsimax271000";
        email = "github2@adamg.win";
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
