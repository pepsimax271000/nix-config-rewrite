{ inputs, ... }: {

  # add custom package overlays here
  # example: pin a package to a specific nixpkgs revision
  # example: patch an existing package

  default = final: prev: {
    # zen-browser from flake input if not yet in nixpkgs
    # zen-browser = inputs.zen-browser.packages.${prev.system}.default;
  };

}
