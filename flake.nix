{
  description = "nix-config";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:0xc000022070/zen-browser-flake";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yazi = {
      url = "github:sxyazi/yazi";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, stylix, ... } @ inputs:
  let
    inherit (self) outputs;
    system = "x86_64-linux";

    mkSystem = hostname: extraModules: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs outputs hostname; };
      modules = [
        ./hosts/${hostname}
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        {
          home-manager.sharedModules = [
            inputs.noctalia.homeModules.default
            inputs.zen-browser.homeModules.beta
          ];
        }
      ] ++ extraModules;
    };

  in {

    nixosConfigurations = {

      multi = mkSystem "multi" [];
      heavy = mkSystem "heavy" [
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-w520
        inputs.nixos-hardware.nixosModules.common-gpu-nvidia-disable
      ];

    };

    overlays = import ./overlays { inherit inputs; };

  };

}
