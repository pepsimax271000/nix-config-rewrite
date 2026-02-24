{ ... }: {

  imports = [
    ./bootloader.nix
    ./home-manager.nix
    ./locale.nix
    ./networking.nix
    ./nfs.nix
    ./nix.nix
    ./options.nix
    ./program.nix
    ./security.nix
    ./sops.nix
    ./users.nix
  ];

}
