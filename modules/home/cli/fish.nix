{ pkgs, ... }: {

  programs = {

    fish = {
      enable = true;

      plugins = [
        {
          name = "fzf-fish";
          src  = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "autopair";
          src  = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "done";
          src  = pkgs.fishPlugins.done.src;
        }
      ];

      shellAbbrs = {
        g    = "git";
        gc   = "git commit";
        gp   = "git push";
        gs   = "git status";
        nru   = "nixos-rebuild switch --flake .# --upgrade";
        hms  = "home-manager switch --flake .#";
        nfu  = "nix flake update";
      };

      functions = {
        mkcd = {
          body = "mkdir -p $argv && cd $argv";
        };
      };

      interactiveShellInit = ''
        set -gx EDITOR nvim
        set -gx VISUAL nvim
      '';

    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

  };

}
