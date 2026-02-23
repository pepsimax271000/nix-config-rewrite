{ inputs, pkgs, ... }: {

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    package = inputs.yazi.packages.${pkgs.system}.default.override {
      _7zz = pkgs._7zz-rar;
    };

    settings = {
      manager = {
        ratio = [ 1 3 4 ];
        linemode = "size";
        show_symlink = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        sort_sensitive = false;
      };
    };
  };

  home = {
    packages = with pkgs; [
      ffmpegthumbnailer 
      unar
      jq
      poppler
      fd
      ripgrep
    ];
  };

}
