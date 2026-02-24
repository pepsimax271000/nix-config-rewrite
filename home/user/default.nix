{ vars, ... }: {

  imports = [
    ../../modules/home/common
  ];

  home = {
    username    = vars.username;
    homeDirectory = "/home/${vars.username}";
  };

}
