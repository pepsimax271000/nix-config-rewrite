{ pkgs, ... }: {
  
  environment.systemPackages = with pkgs; [
    bc
    gdu
    p7zip
    killall
    sops
    unrar
    unzip
    vulkan-tools
  ];
}


