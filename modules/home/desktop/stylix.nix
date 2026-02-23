{ config, lib, pkgs, ... }: {

  stylix = {
    targets = {
      zen-browser = {
        profileNames = [
          "default"
        ];
      };
    };
  };
}
