{ inputs, outputs, vars, config, lib, ... }: {

  home-manager = {
    useGlobalPkgs    = true;
    useUserPackages  = true;
    extraSpecialArgs = { inherit inputs outputs vars; };

    sharedModules = [
      { _module.args.inputs = inputs; }
    ];

    users.${vars.username} = if config.custom.server.enable
      then import ../../../home/user/server.nix
      else import ../../../home/user/desktop.nix;

  };

}
