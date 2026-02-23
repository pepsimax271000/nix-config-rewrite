{ ... }: {

  imports = [
    ./default.nix
    ../../modules/home/cli
  ];

  # servers get fish + tmux + git + cli tools
  # no desktop, no gui apps

}
