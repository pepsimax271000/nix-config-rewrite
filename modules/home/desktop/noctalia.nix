{ pkgs, ... }: {

  programs.noctalia-shell = {
    enable = true;
  };

  programs.noctalia-shell.systemd.enable = true;
}
