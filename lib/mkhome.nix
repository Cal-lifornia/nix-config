{ nixpkgs, inputs }:
# name is the homeConfigurations key, e.g. "whobson@traveler"
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

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  specialArgs = {
    inherit
      inputs
      username
      isMac
      isLinux
      isLinuxDesktop
      isDesktop
      ;
    homeConfigName = name;
    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};
    inherit (inputs)
      catppuccin
      helix-master
      nixvim
      nixgl
      ;
  };
in
inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = specialArgs;
  modules = [ ../home/home-manager.nix ];
}
