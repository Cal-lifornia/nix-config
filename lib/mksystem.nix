{
  nixpkgs,
  inputs,
}:
name:
{
  system,
  username,
  args,
  darwin ? false,
  wsl ? false,
  desktop ? false,
}:
let
  isWSL = wsl;
  isDesktop = desktop;

  machineConfig = ../machines/${name}.nix;
  homeConfig = ../machines/home/${name}.nix;

  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};

  specialArgs = {
    inherit username;
    inherit pkgs-stable;
    inherit args;
  };

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;
in
systemFunc rec {
  inherit system;
  inherit specialArgs;

  modules = [
    { nixpkgs.config.allowUnfree = true; }

    (if isWSL then inputs.nixos-wsl.nixosModules.default else { })

    machineConfig
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = inputs // specialArgs;
      home-manager.users.${username} = import homeConfig {
        isDesktop = isDesktop;
        inputs = inputs;
      };
    }

    {
      config._modules.args = {
        currentSystem = system;
        currentSystemUser = username;
        isWSL = isWSL;
        inputs = inputs;
      };
    }

  ];
}
