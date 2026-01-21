{
  nixpkgs,
  inputs,
}:
name:
{
  system,
  username,
  darwin ? false,
  desktop ? false,
  generator ? false,
  cosmic ? true,
}:
let
  isDesktop = desktop;
  isMac = darwin;
  isLinux = !darwin;
  isLinuxDesktop = isLinux && isDesktop;

  machineConfig = ../machines/${name}.nix;
  homeConfig = ../home/home-manager.nix;

  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
  hyprland = inputs.hyprland;
  catppuccin = inputs.catppuccin;
  helix-master = inputs.helix-master;
  stylix = inputs.stylix;

  specialArgs = {
    inherit username;
    inherit pkgs-stable;
    inherit isMac;
    inherit isLinux;
    inherit isLinuxDesktop;
    inherit isDesktop;
    inherit cosmic;
    inherit
      hyprland
      catppuccin
      helix-master
      stylix
      ;
  };

  systemFunc = nixpkgs.lib.nixosSystem;
  home-manager = inputs.home-manager.nixosModules;
in
systemFunc rec {
  inherit system;
  inherit specialArgs;

  modules = [
    { nixpkgs.config.allowUnfree = true; }

    (if generator then inputs.self.nixosModules.myFormats else { })
    (if isLinuxDesktop then stylix.nixosModules.stylix else { })

    machineConfig
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = inputs // specialArgs;
      home-manager.users.${username} = import homeConfig {
        inputs = inputs;
      };
    }

  ];
}
