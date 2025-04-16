{ nixpkgs, inputs }:
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

  homeConfig = ../home/home-manager.nix;
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${system};

  catppuccin = inputs.catppuccin;
  helix-master = inputs.helix-master;
  pkgs = import nixpkgs {
    config.allowUnfree = true;
    system = "${system}";
  };

  specialArgs = {
    inherit username;
    inherit pkgs-stable;
    inherit catppuccin;
    inherit helix-master;
  };

  home-manager = inputs.home-manager.lib.homeManagerConfiguration;
in
home-manager rec {
  inherit system;
  inherit pkgs;

  extraSpecialArgs = inputs // specialArgs;

  modules = [
    (import homeConfig {
      isDesktop = isDesktop;
      isLinuxDesktop = isLinuxDesktop;
      inputs = inputs;
    })
  ];
}
