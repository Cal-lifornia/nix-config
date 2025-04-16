{
  nixpkgs,
  inputs,
}:
name:
{
  system,
  username,
  darwin ? false,
  wsl ? false,
  desktop ? false,
}:
let
  isWSL = wsl;
  isDesktop = desktop;
  isLinuxDesktop = !darwin && desktop;

  machineConfig = ../machines/${name}.nix;
  homeConfig = ../home/home-manager.nix;

  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
  hyprland = inputs.hyprland;
  catppuccin = inputs.catppuccin;
  helix-master = inputs.helix-master;
  stylix = inputs.stylix;
  pkgs = import nixpkgs {
    config.allowUnfree = true;
    system = "${system}";
  };

  specialArgs =
    {
      inherit username;
      inherit pkgs-stable;
    }
    // (
      if isLinuxDesktop then
        {
          inherit
            hyprland
            catppuccin
            helix-master
            stylix
            ;
        }
      else
        { }
    );

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;
in
systemFunc rec {
  inherit system;
  inherit specialArgs;
  inherit pkgs;

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
