{ ... }: {

  programs = {

    git = {
      enable = true;

      settings.user = {
        name = "Your Name";
        email = "you@yourdomain.com";
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
