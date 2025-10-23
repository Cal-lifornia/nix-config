{ nixpkgs, inputs }:
name:
{
  system,
  username,
  darwin ? false,
  desktop ? false,
}:
let
  isDesktop = desktop;
  isMac = darwin;
  isLinux = !darwin;
  isLinuxDesktop = isLinux && isDesktop;

  homeConfig = ../home/home-manager.nix;
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};

  nixgl = inputs.nixgl;
  catppuccin = inputs.catppuccin;
  helix-master = inputs.helix-master;
  stylix = inputs.stylix;
  pkgs = import nixpkgs {
    config.allowUnfree = true;
    system = "${system}";
  };

  specialArgs = {
    inherit stylix;
    inherit username;
    inherit pkgs-stable;
    inherit catppuccin;
    inherit helix-master;
    inherit isMac;
    inherit isLinux;
    inherit isLinuxDesktop;
    inherit isDesktop;
    inherit nixgl;
  };

in
inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = inputs // specialArgs;

  modules = [
    (import homeConfig {
      inputs = inputs;
    })
    (if isLinuxDesktop then stylix.homeModules.stylix else { })
  ];
}
