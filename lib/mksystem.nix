{
  nixpkgs,
  inputs,
}:
name:
{
  system,
  user,
  darwin ? false,
  wsl ? false,
  homeManaged ? false,
}:
let
  isWSL = wsl;

  machineConfig = ../machines/${name}.nix;
  homeConfig = ../machines/home/${name}.nix;
  specialArgs = {
    username = user;
  };

  pkgs = import nixpkgs;

  systemFunc =
    if homeManaged then inputs.home-manager.lib.homeManagerConfiguration else nixpkgs.lib.nixosSystem;
in
systemFunc rec {
  inherit system;
  inherit pkgs;

  modules = [
    { nixpkgs.config.allowUnfree = true; }

    (if isWSL then inputs.nixos-wsl.nixosModules.default else { })

    (
      if homeManaged then
        homeConfig inputs.catppuccin.homeModules.catppuccin
      else
        machineConfig inputs.catppuccin.nixosModules.catppuccin
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;

            home-manager.users.${user} = {
              imports = [
                homeConfig
                inputs.catppuccin.homeModules.catppuccin
              ];
            };
          }
    )
    {
      config._modules.args = {
        currentSystem = system;
        currentSystemUser = user;
        isWSL = isWSL;
        inputs = inputs;
      };
    }

  ];
}
// (if homeManaged then { extraSpecialArgs = inputs // specialArgs; } else { inherit specialArgs; })
