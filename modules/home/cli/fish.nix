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
          "vim" = "nvim";
          "vi" = "nvim";
          "v" = "nvim";
          "neovim" = "nvim";
          "n" = "nvim";
          "vfzf" = "nvim $(fzf)";
          "cp" = "cp -iv";
          "mv" = "mv -iv";
          "rm" = "rm -vI";
          "rsync" = "rsync -vrPlu";
          "md" = "mkdir -pv";
          "fa" = "fastfetch --config examples/13.jsonc";
          
          "g" = "git";
          "gc" = "git clone";
          "ga" = "git add";
          "gaa" = "git add -A";
          "gcm" = "git commit -m";
          "gp" = "git push";
          "gpp" = "git pull";
          
          "yt" = "yt-dlp --embed-metadata -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'";
          "yta" = "yt -x -f bestaudio/best";
          "ffmpeg" = "ffmpeg -hide_banner";
          
          "ls" = "eza --group-directories-first --icons always";
          "ll" = "eza --group-directories-first -lag --icons always --header";
          "grep" = "rg";
          "cat" = "bat";
          "cd" = "z";
          "cc" = "clear; z";
          "ka" = "killall";
          
          ".." = "z ..";
          "..." = "z ../..";
          "...." = "z ../../..";

          "untar" = "tar -zxvf";
          "mktar" = "tar -cvzf";

          # Nixos related
          "nr" = "nixos-rebuild";
          "nuc" = "nh os switch ~/nix-config -u && nh clean all";
          "nru" = "z ~/nix-config && doas nixos-rebuild switch --flake . --upgrade";
          "nsp" = "nix-shell -p";
          "scg" = "doas nix-collect-garbage -d";
          "ucg" = "nix-collect-garbage -d";
          "cfg" = "z /home/ye/nix-config/";
          "rn" = "nh os switch ~/nix-config";

          # SSH related
          "glados" = "ssh glados";
          "r730" = "ssh r730";
          "3dp" = "ssh hingeproblems";
          "router" = "ssh 10.1.10.2";
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
