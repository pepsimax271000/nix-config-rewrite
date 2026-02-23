{ ... }: {

  imports = [
    ./git.nix
    ./shell.nix
  ];

  home = {
    stateVersion = "25.11";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

}
