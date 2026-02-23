{ pkgs, ... }: {

  programs = {

    neovim = {
      enable       = true;
      defaultEditor = true;
      viAlias      = true;
      vimAlias     = true;

      extraPackages = with pkgs; [
        # LSP servers
        nil            # nix LSP
        lua-language-server
        nodePackages.typescript-language-server
      ];

      plugins = with pkgs.vimPlugins; [
        lazy-nvim
      ];

      extraConfig = ''
      set tabstop=2
      set shiftwidth=2
      set softtabstop=2
      set expandtab
    '';
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

}
