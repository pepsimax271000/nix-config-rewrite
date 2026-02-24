{ ... }: {

  imports = [
    ./bootloader.nix
    ./locale.nix
    ./networking.nix
    ./nfs.nix
    ./nix.nix
    ./options.nix
    ./security.nix
    ./users.nix
  ];

}
