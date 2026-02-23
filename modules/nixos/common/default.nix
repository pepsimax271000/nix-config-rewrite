{ ... }: {

  imports = [
    ./bootloader.nix
    ./nix.nix
    ./nfs.nix
    ./locale.nix
    ./users.nix
    ./security.nix
    ./options.nix
  ];

}
